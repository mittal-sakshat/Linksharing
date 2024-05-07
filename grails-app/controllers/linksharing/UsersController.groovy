package linksharing

import linksharing.Users
import grails.validation.ValidationException
import org.grails.databinding.xml.GPathResultMap
import org.springframework.web.multipart.MultipartFile

import javax.validation.constraints.Null

import static org.springframework.http.HttpStatus.*

class UsersController {

    def usersService

    def index() {
        Users u = session.user1
        def x = usersService.index(u)
        if (u == null) {
            redirect(uri: '/')
            return
        }
        def top = x.to

        render(view: 'editProfile', model: [u: u, to: top])
    }


    def editProfile() {
        Users u = session.user1
        if (u == null) {
            redirect(uri: '/')
            return
        }

        def x = usersService.editProfile(u, params)
        try {
            x.a.save(flash: true,failOnError: true)
            flash.message = "Profile edited Successfully!"
        }catch (Exception e){
                flash.error = "Error" + e.message
        }
        session.user1 = x.a
        redirect(action: 'index')
    }


    def updatePassword() {
        Users u = session.user1
        if (u == null) {
            redirect(uri: '/')
            return
        }
        def x = usersService.updatePassword(u, params)
        if(x.a == null) flash.message = "Password and confirm Password are not same!"
        else{
            session.user1 = x.a
            flash.message = "Password updated successfully !"
        }
        redirect(action: 'index')
    }


    def forgotPassword() {
        render(view: '/users/forgotPassword')
    }


    def forgotPasswordLogic(params) {
        def x = usersService.forgotPasswordLogic(params)
        if(x == null) {
            flash.message = "user with given email not registered"
        }
        else {
            if(x==-1){
                flash.message = "passwords don't match"
            }else if(x==1) {
                flash.message = "Password changed !"
            }
        }
        render(view: '/index')

    }


    def profile() {
        Users u = session.user1
        if (u == null) {
            redirect(uri: '/')
            return
        }
        def x = usersService.profile(u,params)
        render(view: 'profile', model: [paginatedList: x.paginatedList, u: x.u, posts: x.li, i: x.i, j: x.j,siz: x.siz as long,hasNext: x.hasNext, hasPrev: x.hasPrev,totalPages: x.totalPages])
    }



}
