package linksharing

import linksharing.Topic

class TopicController {

    def topicService

    def index() {
        Users u = session.user1
        if (u == null) {
            redirect(uri: '/')
            return
        }
        def x = topicService.index(u, params)
        Topic t = Topic.findById(params.params as long)
        List<Resources> posts = x.li.reverse()
        render(view: 'topic', model: [u: x.u, t: x.t, posts: posts,query:params.params2,page: x.page as long, siz: x.siz as long,hasNext: x.hasNext as boolean, hasPrev: x.hasPrev as boolean,totalPages:x.totalPages as long])
    }

    def nextPageTopic(){
        println(params)
        println(params.params)
        Users u = session.user1
        if (u == null) {
            redirect(uri: '/')
            return
        }
        Topic t = Topic.findById(params.params as long)
        List<Resources> li = Resources.findAllByTopic(t)
        List<Resources> lii = Resources.findAllByTopic(t)
        for (item in lii) {
            if (Subscription.findByTopicAndUser(item.topic, u) == null) {
                li.remove(item)
            }
//            } else {
//                def readingItems = ReadingItem.findAllByResource(item)
//                println(readingItems)
//                for (readingItem in readingItems) {
//                    if (readingItem.user.id == u.id) {
//                        println(readingItem)
//                        li.remove(item)
//                    }
//                }
        }

        Long page = params.page == null ? 1 : params.page.toLong()
        Integer maxPerPage = 5
        Integer offset = (page - 1) * (maxPerPage)
        List<Resources> abc = Resources.createCriteria().listDistinct {
            eq('deleted',false)
            topic{
                eq('visibility', Topic.Visibility.Public)
            }
        }
        Long totalCount = abc.size()
        Long totalPages = (totalCount / maxPerPage) + (totalCount % maxPerPage > 0 ? 1 : 0)
        Integer endIndex = Math.min(totalCount, offset+maxPerPage)
        List<Resources> lis = li.subList(offset,endIndex)
        Boolean hasNext = (page < totalPages)

        Boolean hasPrev = (page > 1)
        render(template: '/Templates/posts', model: [t: t, posts: lis, page: page, siz: totalCount,hasNext: hasNext, hasPrev: hasPrev,totalPages:totalPages])

    }

    def saveTopic() {
        def x = topicService.saveTopic(params)
        if (x == 0) {
            flash.message = "User already has a topic with same name !"
            redirect(controller: 'dashboard', action: 'index')
        } else {
            flash.message = "Topic created Successfully"
            redirect(controller: 'dashboard', action: 'index')
        }
    }

    def deleteTopic() {
        Users u = session.user1
        if (u == null) {
            redirect(uri: '/')
            return
        }
        def x = topicService.deleteTopic(params)
        try{
            x.t.deleted = 1
            x.t.save(flush: true)
            flash.message = "Topic deleted !"
        }
        catch (Exception e){
            flash.error = "Error"+e
        }
        redirect(controller: 'dashboard', action: 'index')
    }
}



