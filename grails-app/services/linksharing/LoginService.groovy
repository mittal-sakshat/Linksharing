package linksharing

import org.springframework.web.multipart.MultipartFile

class LoginService {


    def index(def params) {
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
        println(data+"kjreohjbio")

        List<Resources> dataRecent = Resources.createCriteria().listDistinct {
            eq('deleted', false)
            topic{
                eq('visibility', Topic.Visibility.Public)
            }
            // Accessing the visibility property of the associated topic
            order('dateCreated', 'desc')

            // Pagination parameters
            maxResults(maxPerPage)
            firstResult(offset)
        }
        println(dataRecent)
        println(page+"hjhoewirhnboi")
        println(totalPages)
        Boolean hasNext = (page < totalPages)

        Boolean hasPrev = (page > 1)
        return [dataForPage: data, dataRecent: dataRecent, page: page, siz: totalCount,hasNext: hasNext, hasPrev: hasPrev,totalPages:totalPages]
    }






    def nextPageRecentShare(def params) {
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

        List<Resources> dataRecent = Resources.createCriteria().listDistinct {
            eq('deleted', false)
            topic{
                eq('visibility', Topic.Visibility.Public)
            }
            // Accessing the visibility property of the associated topic
            order('lastUpdated', 'desc')

            // Pagination parameters
            maxResults(maxPerPage)
            firstResult(offset)
        }
        println(page+"kjirneire")
        println(totalPages+"ing4wbirenb")
        Boolean hasNext = (page < totalPages)

        Boolean hasPrev = (page > 1)
        return [dataForPage: data,dataRecent: dataRecent, page: page, siz: totalCount,hasNext: hasNext, hasPrev: hasPrev,totalPages:totalPages]
    }






    def nextPage1(def params) {
        def page = params.page == null ? 1 : params.page.toLong()
        def maxPerPage = 2
        def offset = (page - 1) * (maxPerPage)
        def abc = Resources.createCriteria().listDistinct {
            topic {
                eq('visibility', Topic.Visibility.Public)
            }
            eq('deleted', false)
        }
        def siz = abc.size()
        def dataForPage = Resources.createCriteria().listDistinct () {
            topic {
                eq('visibility', Topic.Visibility.Public)
            }
            eq('deleted', false)
            maxResults(maxPerPage)
            firstResult(offset)
        }
        [dataForPage: dataForPage, page: page, siz: siz]
    }






    def login(def params) {
        Users u = Users.findByEmailAndPassword(params.email1, params.password)
        return u
    }


}