package linksharing

import org.springframework.web.multipart.MultipartFile

class TopicService {

    def index(Users u, def params) {
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

        Long totalCount = li.size()
        Long totalPages = (totalCount / maxPerPage) + (totalCount % maxPerPage > 0 ? 1 : 0)
        Integer endIndex = Math.min(totalCount, offset+maxPerPage)
        println(offset)
        println(endIndex)
        List<Resources> lis = li.subList(offset,endIndex)
        Boolean hasNext = (page < totalPages)

        Boolean hasPrev = (page > 1)
        return [u: u, t: t, li: lis, page: page, siz: totalCount,hasNext: hasNext, hasPrev: hasPrev,totalPages:totalPages]
    }


    def saveTopic(def params) {
        Users u = Users.findById((params.id) as long)
        if (Topic.findByNameAndUser(params.name, u) != null) {
            return 0
        } else {
            String v = params.get("visibility")
            Topic t = new Topic(name: params.get("name"), user: u)
            if (v == "public" || v == "PUBLIC" || v == "Public") {
                t.visibility = Topic.Visibility.Public
            } else {
                t.visibility = Topic.Visibility.Private
            }
            t.validate()
            t.deleted = 0
            t.save(flush: true)
            u.addToTopics(t)
            Subscription s = new Subscription(user: u, topic: t, seriousness: Subscription.Seriousness.Very_Serious)
            s.validate()
            if (s.hasErrors()) {
                s.errors.allErrors.each {
                    println it
                }
            }
            if (s.save(flush: true))
                t.addToSubscriptions(s)
            u.addToSubscriptions(s)
            return 1
        }
    }


    def deleteTopic(def params) {
        println(params)
        println("iogebiunbfheoi")
        println(params.id3 + "ionwinbe")
        Topic t = Topic.findById(params.id3)
        println(t)
        List<Resources> r = Resources.findAllByTopic(t)
        println(r)
        println("oihgwiho")
        if (!r.isEmpty()) {
            r.each { it ->
                it.deleted = 1
                it.save(flush: true)
            }
        }

        return [t:t]
    }


}