package linksharing

class ReadingItemController {
    def readingItemService

    def mark(){
        Users u = session.user1
        if(u==null) {
            redirect(uri:'/')
            return
        }
        Resources re = Resources.findById(params.id)
        ReadingItem rn = new ReadingItem()
        rn.user = session.user1
        rn.resource = re
        rn.isRead = true
        r.save(flush:true)
        flash.message = "Post marked as read!"
        redirect(controller:'Dashboard',action:'index')
    }
}
