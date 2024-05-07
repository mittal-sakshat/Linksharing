package linksharing

import grails.converters.JSON

class ResourceRatingController {
    def resourceRatingService



    def index() {
        Users u = session.user1
        if(u==null) {
            redirect(uri:'/')
            return
        }
        def x = resourceRatingService.index(u,params)
        render(view: '/posts/posts',model: [u:x.u,r:x.r,to:x.to,rating:x.rating])
    }




    def rating(){
        Users u = session.user1
        if(u==null) {
            redirect(uri:'/')
            return
        }
        println(params)
       def x = resourceRatingService.rating(u,params)

        render(x.rating)
//        redirect(action:'index',params:[r:x.r,rating:x.rating])
    }

}