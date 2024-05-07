package linksharing

import org.springframework.web.multipart.MultipartFile

class ResourceRatingService {


    def index(Users u, def params) {
        Resources read = Resources.findById(params.r)
        List<Topic> to = Topic.list()
        to.sort {a,b ->
            def asize = a.resources.size()
            def bsize = b.resources.size()
            bsize.compareTo(asize)
        }
        return [u:u,r:read,to:to,rating:params.rating]
    }



    def rating(Users u, def params){
        Resources re = Resources.findById(params.id)
        if(!ResourceRating.findByUserAndResource(u,re)){
            ResourceRating r = new ResourceRating()
            r.user = u
            r.resource = re
            println(params.n)
            r.score = params.n as long
            r.save(flush: true)
        }
        else
        {
            ResourceRating r = ResourceRating.findByUserAndResource(u,re)
            println(params.n)
            r.score = params.n as long
            r.save(flush: true)
        }
        Long rating  = 0
        for(item in ResourceRating.findAllByResource(re)){
            rating += item.score
        }
        if(ResourceRating.findAllByResource(re).size() != 0)
            rating /= ResourceRating.findAllByResource(re).size()
        re.average = rating
        re.save(flush: true)
        return [r:params.id,rating:rating]

    }



}