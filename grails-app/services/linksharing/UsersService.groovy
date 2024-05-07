package linksharing

import org.springframework.boot.actuate.metrics.dropwizard.ReservoirFactory
import org.springframework.web.multipart.MultipartFile

class UsersService {



    def index(Users u) {
        def to = Topic.findAllByDeleted(false)
        to.sort { a, b ->
            def asize = a.resources.findAll { !it.deleted }.size()
            def bsize = b.resources.findAll { !it.deleted }.size()
            bsize.compareTo(asize)
        }
        def top = to.size() == 0 ? [] : to.subList(0, to.size() < 2 ? to.size() : 2)
        return [to: top]
    }




    def editProfile(Users u, def params) {
        println("hello " + params)
        Users a = Users.findById(u.id)
        a.firstName = params.firstName
        a.lastName = params.lastName
        a.email = params.email
        a.username = params.username
        println(params.photo)
        MultipartFile file = params.photo
        a.photo = file?.getBytes()
        println(u)

        return [a: a]
    }




    def updatePassword(Users u, def params) {
        Users a = Users.findById(u.id)
        if (a == null) {
            return null
        } else {

            if (params.password == params.confirmPassword) {
                a.password = params.password
                a.confirmPassword = params.confirmPassword
                return [a: a]
            } else {
                return [a: null]
            }
        }
    }




    def forgotPasswordLogic(params) {
        Users u = Users.findByEmail(params.email)
        if (u) {
            if (params.password == params.confirmPassword) {
                u.password = params.password
                u.confirmPassword = params.confirmPassword
                u.save(flush: true)
                return 1
            }
            else{
                return -1
            }
        } else {
            return null
        }
    }




    def profile(Users u, def params) {
        List<Resources> li = Resources.findAllByUser(u)
        List<Resources> lii = Resources.findAllByUser(u)

        for (item in lii) {
            if (item.deleted == true) {
                li.remove(item)
            }
//            } else {
//                def readingItems = ReadingItem.findAllByResource(item)
//                for (readingItem in readingItems) {
//                    if (readingItem.user.id == u) {
//                        li.remove(item)
//                    }
//                }
//            }
        }
        List<Subscription> l = Subscription.findAllByUser(u)
        List<Subscription> x = l.findAll {
            it -> it.topic.deleted == true
        }
        List<Subscription> l1 = l.findAll {
            it -> it.topic.deleted == false && (it.topic.resources.findAll { !it.deleted }.size() == 0 || it.topic.visibility == Topic.Visibility.Private)
        }
        Set<Subscription> la = l.toSet() - x.toSet()
        Set<Subscription> l2 = la.toSet() - l1.toSet()
        List<Subscription> l3 = l2.toList()
        l3.sort({ a, b ->
            Resources alastUpdated = a.topic.resources.findAll { !it.deleted }.max({ it -> it.lastUpdated })
            Resources blastUpdated = b.topic.resources.findAll { !it.deleted }.max({ it -> it.lastUpdated })
            Date lastUpdated1 = alastUpdated.lastUpdated
            Date lastUpdated2 = blastUpdated.lastUpdated
            lastUpdated2.compareTo(lastUpdated1)
        })
        l3.addAll(l1)

        Integer siz = l3.size()


        List<Subscription> paginatedList = siz == 0 ? [] : l3.subList(0, siz < 2 ? siz : 2)


        Integer i = 0
        for (item in Subscription.findAllByUser(u)) {
            if (item.topic.deleted == false) i++
        }
        Integer j = 0
        for (item in Topic.findAllByUser(u)) {
            if (item.deleted == false) j++
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
        Boolean hasNext = (page < totalPages)
        Boolean hasPrev = (page > 1)


        List<Resources> data = Resources.createCriteria().listDistinct {
            eq('deleted', false)
            topic{
                eq('visibility', Topic.Visibility.Public)
            }
            // Accessing the visibility property of the associated topic
            order('average', 'desc')

            // Pagination parameters
            maxResults(maxPerPage)
            firstResult(offset)
        }
        return [paginatedList: paginatedList, u: u, li: data, i: i, j: j,siz: totalCount,hasNext: hasNext, hasPrev: hasPrev,totalPages:totalPages]

    }
}