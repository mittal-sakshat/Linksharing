package linksharing
import org.springframework.http.HttpHeaders
import org.springframework.http.HttpStatus
import org.grails.datastore.mapping.query.Query
import org.springframework.web.multipart.MultipartFile
import org.springframework.http.MediaType


class SearchController {

    def search(){
        List<Topic> to = Topic.findAllByDeleted(false)
        to.sort { a, b ->
            def asize = a.resources.findAll { !it.deleted }.size()
            def bsize = b.resources.findAll { !it.deleted }.size()
            bsize.compareTo(asize)
        }
        List<Topic> top = to.size() == 0 ? [] : to.subList(0, to.size() < 5 ? to.size() : 5)

        Long page = params.page == null ? 1 : params.page.toLong()
        Integer maxPerPage = 5
        Integer offset = (page - 1) * (maxPerPage)

        List<Resources> abc = Resources.createCriteria().listDistinct {
            topic {
                eq('visibility', Topic.Visibility.Public)
            }
            eq('deleted', false)
        }
        Long siz = abc.size()
        String query = params.query

        List<Resources> dataForPage = Resources.createCriteria().listDistinct () {
            topic {
                eq('visibility', Topic.Visibility.Public)
            }
            eq('deleted', false)
            order('average', 'desc')
            maxResults(maxPerPage)
            firstResult(offset)
        }
        Set<Resources> ab = dataForPage.toSet()
        List<Resources> bc = ab.toList()


        List<Resources> x = Resources.createCriteria().listDistinct () {
            topic {
                eq('visibility', Topic.Visibility.Public)
            }
            eq('deleted', false)
            or{
                ilike('description',"%${query}%")
                topic{
                    ilike('name',"%${query}%")
                }
            }
            order('average', 'desc')
            maxResults(maxPerPage)
            firstResult(offset)
        }


        Users u = session.user1
//        def res1 = Resources.createCriteria().list {
//            topic{
//                ilike('name',"%${query}%")
//            }
//        }
//        def searchResults = Resources.findAllByDescriptionIlike("%${query}%")
//        res1.addAll(searchResults)
        Set<Resources> res2 = x.toSet()
        List<Resources> res3 = res2.toList()
        Long totalCount = abc.size()
        Long totalPages = (totalCount / maxPerPage) + (totalCount % maxPerPage > 0 ? 1 : 0)
        Boolean hasNext = (page < totalPages)

        Boolean hasPrev = (page > 1)
        render(view: '/search/search' , model : [posts: res3,u:u,to:top,dataForPage: bc, page: page,query:params.query, siz: totalCount,hasNext: hasNext, hasPrev: hasPrev,totalPages:totalPages])
    }




//    def searchPost(){
//
//        def to = Topic.list()
//        to.sort {a,b ->
//            def asize = a.resources.findAll{!it.deleted}.size()
//            def bsize = b.resources.findAll{!it.deleted}.size()
//            bsize.compareTo(asize)
//        }
//
//        def page = params.page == null ? 1 : params.page.toLong()
//        def maxPerPage = 2
//        def offset = (page - 1) * (maxPerPage)
//        def abc = Resources.createCriteria().list {
//            topic {
//                eq('visibility', Topic.Visibility.Public)
//            }
//            eq('deleted', false)
//        }
//        def siz = abc.size()
//        def dataForPage = Resources.createCriteria().list(max: maxPerPage, offset: offset) {
//            topic {
//                eq('visibility', Topic.Visibility.Public)
//            }
//            eq('deleted', false)
//            order('lastUpdated', 'desc')
//        }
//        println("fdnjugroen"+dataForPage)
//        def query = params.query
//        println(params)
//        Users u = session.user1
//
//        render(template: '/Templates/topPosts', model : [u:u,to:to,dataForPage: dataForPage, page: page, siz: siz])
//    }



    def searchPost() {
        Users u = session.user1
        Long page = params.page == null ? 1 : params.page.toLong()
        Integer maxPerPage = 5
        Integer offset = (page - 1) * (maxPerPage)

        String query = params.query

        List<Resources> abc = Resources.createCriteria().listDistinct {
            topic {
                eq('visibility', Topic.Visibility.Public)
            }
            eq('deleted', false)
            or{
                ilike('description',"%${query}%")
                topic{
                    ilike('name',"%${query}%")
                }
            }
        }

        Long totalCount = abc.size()
        List<Resources> x = Resources.createCriteria().listDistinct () {
            topic {
                eq('visibility', Topic.Visibility.Public)
            }
            eq('deleted', false)
            or{
                ilike('description',"%${query}%")
                topic{
                    ilike('name',"%${query}%")
                }
            }
            order('average', 'desc')
            maxResults(maxPerPage)
            firstResult(offset)
        }

        Long totalPages = (totalCount / maxPerPage) + (totalCount % maxPerPage > 0 ? 1 : 0)
        Boolean hasNext = (page < totalPages)
        Boolean hasPrev = (page > 1)
        Set<Resources> res2 = x.toSet()
        List<Resources> res3 = res2.toList()
        render(template: '/Templates/posts', model: [query:query,posts: res3,u:u, page: page as long, siz: totalCount as long,hasNext: hasNext, hasPrev: hasPrev,totalPages:totalPages])
    }





    def nextPage(){
        def page = params.page == null ? 1 : params.page.toLong()
        println(page)
        Integer maxPerPage = 5

        Integer offset = (page - 1) * (maxPerPage)
        def startIndex = offset
        def abc = Resources.createCriteria().list {
            topic {
                eq('visibility', Topic.Visibility.Public)
            }
            eq('deleted', false)
        }
        def siz = abc.size()
        println(siz)
        def query = params.query
        List<Resources> dataForPage = Resources.createCriteria().list(max: maxPerPage,offset: offset) {
            topic {
                eq('visibility', Topic.Visibility.Public)
            }
            eq('deleted', false)
            or{
                ilike('description',"%${query}%")
                topic{
                    ilike('name',"%${query}%")
                }
            }
            order('average', 'desc')
        }
        def endIndex = Math.min(offset + maxPerPage, dataForPage.size())
        println(dataForPage.size())
        println("iejnirjeo"+dataForPage)
        def res2 = dataForPage.toSet()
        def res3 = res2.toList()
        println("hkuwehio"+res3)
        render(template: '/Templates/posts', model: [posts: res3, page: page as long, siz: siz as long])
    }


}