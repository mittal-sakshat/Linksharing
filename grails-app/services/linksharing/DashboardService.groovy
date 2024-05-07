package linksharing

import org.springframework.web.multipart.MultipartFile

class DashboardService {


    def index(Users u){
        def li = Resources.createCriteria().list(){
            eq('deleted',false)
        }
        def lii = Resources.createCriteria().list(){
            eq('deleted',false)
        }
        for (item in lii) {
            println(li)
            println(item)
            if (Subscription.findByTopicAndUser(item.topic, u) == null) {
                li.remove(item)
            } else {
                def readingItems = ReadingItem.findAllByResource(item)
                println(readingItems)
                for (readingItem in readingItems) {
                    if (readingItem.user.id == u.id) {
                        println(readingItem)
                        li.remove(item)
                    }
                }
            }
        }

        def l = Subscription.findAllByUser(u)
        def x = l.findAll {
            it -> it.topic.deleted == true
        }
        def l1 = l.findAll {
            it -> it.topic.deleted == false && (it.topic.resources.findAll { !it.deleted }.size() == 0 || it.topic.visibility == Topic.Visibility.Private)
        }
        def la = l.toSet() - x.toSet()
        def l2 = la.toSet() - l1.toSet()
        def l3 = l2.toList()
        l3.sort({ a, b ->
            def alastUpdated = a.topic.resources.findAll { !it.deleted }.max({ it -> it.lastUpdated })
            def blastUpdated = b.topic.resources.findAll { !it.deleted }.max({ it -> it.lastUpdated })
            def lastUpdated1 = alastUpdated.lastUpdated
            def lastUpdated2 = blastUpdated.lastUpdated
            lastUpdated2.compareTo(lastUpdated1)
        })
        l3.addAll(l1)
        println(l3)
        def siz = l3.size()
        def paginatedList = siz == 0 ? [] : l3.subList(0, siz < 5 ? siz : 5)
        def to = Topic.createCriteria().listDistinct {
            eq('deleted',false)
            eq('visibility',Topic.Visibility.Public)
        }
        to.sort {a,b ->
            def asize = a.resources.findAll{!it.deleted}.size()
            def bsize = b.resources.findAll{!it.deleted}.size()

            bsize.compareTo(asize)
        }
        def i = 0
        for(item in Subscription.findAllByUser(u)){
            if(item.topic.deleted == false) i++
        }
        def j = 0
        for(item in Topic.findAllByUser(u)){
            if(item.deleted == false) j++
        }
        def top = to.size() == 0 ? [] : to.subList(0,to.size()<5 ? to.size() : 5)
        println(top)
        def lis = li.reverse()
        return [u: u, paginatedList: paginatedList,li:lis,to:top,i:i,j:j]

    }




}