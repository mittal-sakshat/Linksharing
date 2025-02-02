package linksharing

import linksharing.SendInvitation
import linksharing.InvitationService
import grails.plugin.asyncmail.AsynchronousMailService

class MailController {
    InvitationService invitationService;

    def index() { }

    def SendMail(){

        println params;
        Users user  = session.user1;

        Topic topic= Topic.findById(params.selectedTopicId);

        String token = generateAuthToken();
        try {
            SendInvitation obj = new SendInvitation( receiverEmail: params.email, authToken: token , topicId: topic.id);
            obj.save(flush: true);
        }
        catch (Exception e){
            println(e);
        }
        println topic;
        String link = "http://localhost:8181/mail/subscription/?receiverEmail=${params.email}&authToken=${token}&topicId=${params.topic}";
        // Construct the email body with the link
        String body = "Invitation to Subscribe the Topic :  ${link}";
        String subject = "Invitation for Subscription of Topic";
        Boolean result =  invitationService.sendEmail(params.email, body,subject);
        if(result){
            flash.message = "successfully send invitation!!"
        }else{
            flash.error  = "an error encountered while sending mail"
        }
        redirect(controller: "Dashboard", action: "index");
    }

    def generateAuthToken() {
        // Generate a UUID
        String authToken = UUID.randomUUID().toString()
        return authToken
    }


    def Subscription() {
        if (session.user) {
            String receiverEmail = params.receiverEmail
            String authToken = params.authToken
            println params.topic + " abcsdsef";
            Long topicId = params.topicId.toLong();
            Users user = session.user;
            Topic topic = Topic.findById(topicId);
            SendInvitation verification = SendInvitation.findByAuthTokenAndReceiverEmail(authToken, user.email);
            Subscription subs = Subscription.findByUserAndTopic(user,topic);
            if (verification != null && verification.isValid == true) {
                Subscription subscribe = new Subscription(topic: topic, user: user, seriousness: "Serious");
                subscribe.save(flush: true, failOnError: true);
                verification.isValid = false;
                verification.save(flush:true, failOnError:true);
                flash.message = "successfully Subscription through Link!";
                redirect(controller: "Dashboard", action: "index");
            } else if(verification !=null || subs!=null){
                flash.message = "You have already subscribed to the topic!"
                redirect(controller: "Dashboard", action: "index");
            }
            else {
                String msg = "You are not authenticated user."
                render(template: "/templates/errorHandling", model: [msg: msg]);
            }
        }else{
            flash.message = "login first to subscribe the topic";
            redirect(controller: "Login");
        }
    }



}