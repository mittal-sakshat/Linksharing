package linksharing

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/*"(controller: "urlFilter")
        "/"uri: '/login/index'
//        "/"(view:"/index")
//        "/"(controller: 'Login',action: 'logout')
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
