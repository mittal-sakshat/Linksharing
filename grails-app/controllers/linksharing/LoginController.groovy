package linksharing

import org.springframework.web.multipart.MultipartFile

class LoginController {
    def loginService
    InvitationService invitationService

    def index() {
        def x = loginService.index(params)
        println(x.class)
        println(x)
        render(view: '/index', model: [dataForPage: x.dataForPage, dataRecent: x.dataRecent,page: x.page as long, siz: x.siz as long,hasNext: x.hasNext as boolean, hasPrev: x.hasPrev as boolean,totalPages:x.totalPages as long])
    }


    def nextPageRecentShare() {
        def x = loginService.nextPageRecentShare(params)
        render(template: '/Templates/recentShare', model: [dataForPage: x.dataForPage,dataRecent: x.dataRecent, page: x.page as long, siz: x.siz as long,hasNext: x.hasNext as boolean, hasPrev: x.hasPrev as boolean,totalPages:x.totalPages as long])
    }


    def nextPageTopPost() {
        def x = loginService.nextPageRecentShare(params)
        render(template: '/Templates/topPosts', model: [dataForPage: x.dataForPage,dataRecent: x.dataRecent, page: x.page as long, siz: x.siz as long,hasNext: x.hasNext as boolean, hasPrev: x.hasPrev as boolean,totalPages:x.totalPages as long])
    }


    def login() {
        def u = loginService.login(params)
        if (u != null) {
            session.user1 = u
            if (u.active) {
                redirect(controller: 'Dashboard', action: 'index')
            } else {
                flash.error = "not active user"
                redirect(uri: '/')
            }
        } else {
            flash.error = "Invalid email or password"
            redirect(uri: '/')
        }
    }

    def forgetPass(){
        render(view: "/users/resetPassword" );
    }

    def sendingEmail(){
        println params;
        Users user =  Users.findByEmail(params.email);
        if(user == null ){
            flash.error = "Create an account first!!"
            redirect(controller:"Login");
        }
        String authToken = UUID.randomUUID().toString();
        try {
            SendInvitation obj = new SendInvitation( receiverEmail: params.email, authToken: authToken , topicId: "noId");
            obj.save(flush: true, failOnError : true);
        }
        catch (Exception e){
            println(e);
        }
        String link = "http://localhost:8282/login/resetPassword/?receiverEmail=${params.email}&authToken=${authToken}";
        String body = "Reset Password link :  ${link}";
        String subject = "Reset Password link!!"
        Boolean result =  invitationService.sendEmail(params.email, body, subject);

        if(result){
            flash.message = "Write New Password and Confirm Password!!"
        }else{
            flash.error = "You are not authenticated user, please contact admin or try again"

        }
        redirect(action:"index");
    }

    def ResetPassword(){
        println params;
        String authToken = params.authToken;
        SendInvitation invitation  = SendInvitation.findByAuthToken(authToken);
        if(invitation && invitation.isValid == true){
            invitation.isValid = false;
            invitation.save(flush:true);
            flash.message  = "Authentication successfull!!"
            render(view: "/users/resetPassword");
        }else{
            flash.error = "Authentication failed"
            redirect(action: "index");
        }
    }

    def ResetPass(){
        println params.password
        Users user = Users.findByEmail(params.email);
        println(user)
        user.password = params.password;
        user.save(flush : true, failOnError: true);
        flash.message  =  " Password successfully reset!!"
        redirect(action: "index");
    }




    def register() {
        try {
            def user = new Users(params)
            MultipartFile file = params.photo
            user.photo = file?.getBytes()
            user.active = true
            user.admin = params.key == 'authorizedAccess' ? true : false
            if(user.password != user.confirmPassword){
                flash.error = "Password and confirm Password not matching."
                redirect(uri: '/')
            }else{
                if (user.validate() && user.save(flush: true, failOnError: true)) {
                    flash.message = "User registered Successfully!"
                    session.user1 = user
                    redirect(controller: 'Dashboard', action: 'index')
                } else {
                    flash.error = "Failed to register user."
                    redirect(uri: '/')
                }
            }
        } catch (Exception e) {
            flash.error = "Error: ${e.message}"
            redirect(uri: '/')
        }
    }


    def logout() {
        session.invalidate()
        flash.message = "Logged Out Successfully!"
        redirect(uri: '/')
    }


}