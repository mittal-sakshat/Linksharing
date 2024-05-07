package linksharing

class DashboardController {

    def dashboardService

    def index() {
        Users u = session.getAttribute("user1") as Users
        if(u==null) {
            redirect(uri:'/')
            return
        }
        Long page = params.page == null ? 1 : params.page.toLong()
        Long maxPerPage = 5
        Long offset = (page - 1) * (maxPerPage)
        def x = dashboardService.index(u)
        try{

            List<Resources> abc = Resources.createCriteria().list {
                topic {
                    eq('visibility', Topic.Visibility.Public)
                }
                eq('deleted', false)
            }
            Long siz = abc.size()
            render(view: "dashBoard", model: [u: x.u, paginatedList: x.paginatedList,li:x.li,to:x.to,i:x.i,j:x.j,page:page,siz:siz])

        }
        catch (Exception e){
            flash.message = "Error"+e.getMessage()
           render(view: '/fail')
        }

    }




    def fetchImage()
    {
        def user=Users.get(params.id)
        byte[] imageBytes=user.photo
        response.contentType='image/png/jpeg'
        response.outputStream << imageBytes
        response.outputStream.flush()
        response.outputStream.close()
    }




    def visi() {
        def v = params.var1
        def b = params.tId

        Topic t = Topic.findById(b as long)
        t.visibility = v
        try{
            t.save(flush: true)
        }
        catch (Exception e){
            flash.message = "Error"+e.getMessage()
        }

        redirect(action: 'index')
    }




    def serious() {
        def v = params.var1
        def b = params.tId
        Users u = session.user1
        Topic t = Topic.findById(b as long)
        Subscription s = Subscription.findByTopicAndUser(t, u)
        s.seriousness = v
        s.save(flush: true)
        redirect(action: 'index')
    }






}

