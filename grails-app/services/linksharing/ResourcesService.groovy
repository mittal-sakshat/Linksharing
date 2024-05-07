package linksharing

import org.springframework.web.multipart.MultipartFile

class ResourcesService {

    def index(Users u, def params){
        Resources r = Resources.findById(params.id as long)
        List<Topic> to = Topic.findAllByDeleted(false)
        to.sort { a, b ->
            def asize = a.resources.findAll { !it.deleted }.size()
            def bsize = b.resources.findAll { !it.deleted }.size()
            bsize.compareTo(asize)
        }
        List<Topic> top = to.size() == 0 ? [] : to.subList(0, to.size() < 5 ? to.size() : 5)
        Long i = 0
        for(item in Subscription.findAllByUser(u)){
            if(item.topic.deleted == false) i++
        }
        Long j = 0
        for(item in Topic.findAllByUser(u)){
            if(item.deleted == false) j++
        }
        Long rating  = 0
        for(item in ResourceRating.findAllByResource(r)){
            rating += item.score
        }
        if(ResourceRating.findAllByResource(r).size() != 0)
            rating /= ResourceRating.findAllByResource(r).size()

        [us:u,r:r,to:top,rating:rating]
    }


    def createResource(Users u, def params){

        def x
        Long flag = 0
        Resources r = Resources.findById(params.id as long)
        if(!ReadingItem.findByResourceAndUser(r,u)){
            ReadingItem re = new ReadingItem()
            re.resource = r
            re.user = u
            re.isRead = true
            try{
                re.validate()
                x = re
                flag = 1
            }
            catch (Exception e){
                flag = -1
            }
        }
        else{
            ReadingItem re = ReadingItem.findByResourceAndUser(r,u)
            re.isRead = true;
            x = re
            flag = 0
        }
        [re:x,id:params.id,flag:flag]
    }



    def saveResource(def params){
        if(params.flag){
            Resources r = new Resources(params)
            Users u = Users.findById(params.id)
            r.user = u
            Topic t = Topic.findById(params.selectedTopicId)

            if(t){
                r.topic = t;
                r.deleted = 0
                r.average = 0
                try{
                    r.save(flush:true,failOnError:true)
                    return 1
                }
                catch (Exception e){
                    return 0
                }
            }
            else{
                return -1
            }
        }
    }



    def saveDocResource(def params){
        if(params.flag){
            Resources r = new Resources(params)
            MultipartFile file = params.filePath
            try{
                r.filePath = file?.getBytes()
            }
            catch (Exception e){
                return 2
            }

            Users u = Users.findById(params.id)
            r.user = u
            Topic t = Topic.findById(params.selectedTopicId)
            println(t)
            Integer flag = 0
            if(t){
                r.topic = t;
                r.deleted = 0
                r.average = 0
                println(r.topic.class)
                try{
                    r.save(flush:true,failOnError:true)
                    flag = 1
                    return [flag:flag]
                }
                catch (Exception e){
                    flag = -1
                    return [flag:flag,e:e]
                }
            }
            else{
               return [flag: flag]
            }
        }
    }


    static def add(Integer a,Integer b){
        return a+b
    }

}