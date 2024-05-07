package linksharing

class AdminController {



    def index(){
        Users u = session.user1
        if(u==null) {
            redirect(uri:'/')
            return
        }
        render(view:'admin',model: [u:u])
    }




    def activate(){
        Users u = Users.findById(params.id);
        u.active = true
        try{
            u.save(flush:true,failOnError:true)
        }
        catch(Exception e){
            flash.message = "Error: "+e.getMessage()
        }
        redirect(action: 'index')
    }




    def deactivate(){
        Users u = Users.findById(params.id);
        u.active = false
        try{
            u.save(flush:true,failOnError:true)
        }
        catch (Exception e){
            flash.message = "Error: "+e.getMessage()
        }

        redirect(action: 'index')
    }

}
