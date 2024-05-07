class UrlFilter {

    def filters = {
        allRequests(controller: '*', action: '*') {
            before = {
                if (!springSecurityService.isLoggedIn() && !controllerName.equals("login")) {
                    redirect(controller: "login", action: "index")
                    return false
                }
            }
        }
    }
}