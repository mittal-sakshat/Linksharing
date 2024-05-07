package linksharing
import org.springframework.http.HttpHeaders
import org.springframework.http.HttpStatus
import org.grails.datastore.mapping.query.Query
import org.springframework.web.multipart.MultipartFile
import org.springframework.http.MediaType


class ResourcesController {
    def resourcesService

    def index() {
        Users u = session.user1
        def x = resourcesService.index(u, params)
        println(x.us)
        render(view: '/posts/posts', model: [u: x.us, r: x.r, to: x.to, rating: x.rating])
    }


    def createResource() {
        Users u = session.user1
        if (u == null) {
            redirect(uri: '/')
            return
        }
        def a = resourcesService.createResource(u, params)
        println(a)
        if (a.flag == 1) {
            flash.message = "Post marked as Read !"
            a.re.save(flush: true,failOnError: true)
        }
        else if(a.flag == -1){
            flash.error = "Failed to create resource !"
            redirect(controller: 'dashboard',action: 'index')
        }
        else{
            a.re.save(flush: true,failOnError: true)
        }
        redirect(action: 'index', params: [re: a.re.id, id: a.id])
    }


    def saveResource() {
        def x = resourcesService.saveResource(params)
        if (x) {
            flash.message = "Post created Successfully!"
            redirect(controller: 'Dashboard', action: 'index')
        } else if (x == -1) {
            flash.error = "Error: ${e.message}"
        } else {
            flash.message = "Please create a topic first!"
        }
    }


    def saveDocResource() {
        def x = resourcesService.saveDocResource(params)
        println(x)
        if (x.flag == 1) {
            flash.message = "Post created Successfully!"
        } else if (x.flag == -1) {
            flash.error = "Error: ${x.e.getMessage()}"

        }else if(x.flag == 2){
            flash.message = "File size exceeded!"
        }
        else {
            flash.message = "Please create a topic first!"
        }
        redirect(controller: 'Dashboard', action: 'index')
    }


    def mark() {
        Users u = session.user1
        if (u == null) {
            redirect(uri: '/')
            return
        }
        Resources r = Resources.findById(params.id as long)
        if (!ReadingItem.findByResourceAndUser(r, u)) {
            ReadingItem re = new ReadingItem()
            re.resource = r
            re.user = u
            re.isRead = true
            re.save(flush: true, failOnError: true)
            flash.message = "Post marked as Read Successfully!"
        } else {
            ReadingItem re = ReadingItem.findByResourceAndUser(r, u)
            re.isRead = true;
            re.save(flush: true, failOnError: true)
        }
        redirect(controller: 'Dashboard', action: 'index')
    }


    def deletePost() {
        Resources r = Resources.findById(params.id)
        r.deleted = true
        r.save(flush: true)
        flash.message = "Post deleted Successfully!"
        redirect(controller: 'Dashboard', action: 'index')
    }


    def editPost() {
        Resources r = Resources.findById(params.id)
        r.url = params.url
        r.description = params.description
        r.save(flush: true)
        flash.message = "Post edited Successfully!"
        redirect(action: 'index', params: [id: params.id])
    }


    def downloadFile() {
        Long fileId = params.id as long
        def fileEntity = Resources.get(fileId)
        if (!fileEntity) {
            return
        }

        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=${fileEntity.description}")
        response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE)
        response.setContentLength(fileEntity.filePath.length)

        response.getOutputStream().write(fileEntity.filePath)
        response.getOutputStream().flush()

        // Close the response output stream
        response.getOutputStream().close()

        // Render an empty response since the file has been downloaded
        render(contentType: "text/html", text: "")
    }


}