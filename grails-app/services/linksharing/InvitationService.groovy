package linksharing
import grails.gorm.transactions.Transactional
import grails.plugin.asyncmail.AsynchronousMailService
@Transactional
class InvitationService {
    def mailService
    void serviceMethod() {
        // Your service logic here
    }

    Boolean sendEmail(String sender_email , String body, String value) {
        Boolean flag= true;
        try {
            mailService.sendMail {
                from "linksharing53@gmail.com"
                to sender_email
                subject value
                text body
            }
        }
        catch(Exception e){
            flag = false;
            flash.error = "Error encountered while sending the mail";
        }
        return flag;
    }
}