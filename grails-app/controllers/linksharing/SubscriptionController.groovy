package linksharing

import grails.converters.JSON
import grails.validation.ValidationException
import static org.springframework.http.HttpStatus.*
import linksharing.Subscription

class SubscriptionController {


    def index() {
        def subscriptions = Subscription.list()
        [subscriptions:subscriptions]
    }



    def editSubscriptionName(){
        println(params)
        Topic t = Topic.findById(params.id2)
        println(t)
        t.name = params.name
        Map mp = [:]
        try{
            t.save(flush:true)
            mp['name'] = t.name
            flash.message = "Subscribed Topic name edited Successfully!"
            render mp as JSON
        }
        catch(Exception e){
            render(view: '/fail')
        }
    }

    def subscribe(){

        if(params.u == ''){
            redirect(uri: '/')
            return
        }
        Topic t = Topic.findById(params.t)
        Users u = Users.findById(params.u)
        Subscription s = Subscription.findByTopicAndUser(t,u)
        if(s==null){

            Subscription s1 = new Subscription(topic:t,user:u)
            s1.seriousness =  Subscription.Seriousness.Very_Serious
            try{
                s1.save(flush:true,failOnError:true)
                flash.message = "Topic subscribed!"
                redirect(controller: 'dashboard',action: 'index')
            }
            catch(Exception e){
                render(view: '/fail',model:[Exception:e])
            }
        }
        else{
            flash.message = "already subscribed !"
        }
    }





    def unSubscribe(){

        if(params.u == ''){
            redirect(uri: '/')
            return
        }
        if(params.flag == '0'){
            Subscription s = Subscription.findById(params.t)
            s.delete(flush: true,failOnError: true)
            flash.message = "Topic unsubscribed !"
            Users u = session.user1
            redirect(controller: 'dashboard',action: 'index')
        }
        else{
            Topic t = Topic.findById(params.t)
            Users u = Users.findById(params.u)
            Subscription s = Subscription.findByTopicAndUser(t,u)
            if(s){
                s.delete(flush: true,failOnError: true);
                flash.message = "Topic unsubscribed !"
                redirect(controller: 'dashboard',action: 'index')
            }
            else{
                render("user not subscribed")
            }
        }

    }



}
