<div class="container">
    <!--Home page First row     -->
    <div class="row search-row">
        <nav class="navbar ">
            <div class="container-fluid">
                <a class="navbar-brand">Link Sharing</a>
                <form class="d-flex">
                    <input class="form-control me-2" style="border:2px solid #aea4a4;border-radius:55rem" type="search" placeholder="Search" aria-label="Search">
                    <button type="submit"><i class="fas fa-search"></i></button>
                </form>
            </div>
        </nav>

    </div>
    <!--second row main that includes registration login post recent shares-->
    <div class="row">
        <div class="col-7">
            <!--Recent shares -->
            <div class="row recentShare">
                <div class="row recentRow1" style="background-color:#8f8989">
                    <h6 style="padding-top:3px;padding-bottom:0spx;">Recent Shares</h6>

                </div>
                <div class="row recentRow2" style="padding-bottom:10px;">
                    <div class="col-2">
                        <img src="${assetPath(src:'person.jpg')}" alt="photo">
                    </div>
                    <div class="col-10">
                        <div class="row  " style="margin-bottom:-10px;">
                            <div class="col-4">
                                <p>Uday Pratap Singh</p>
                            </div>
                            <div class="col-4">
                                <p>@Uday 5min</p>
                            </div>
                            <div class="col-4 ">
                                <a href="#">Grails</a>
                            </div>
                        </div>

                        <div class="row recentshareContent" style="margin-bottom:-10px;">
                            <p>These are the recent shares posted by the uday pratap singh these is the same as done</p>
                        </div>

                        <div class="row">
                            <div class="col-4 socialMedia">
                                <a href="www.facebook.com"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="www.facebook.com"><i class="fa-brands fa-twitter"></i></a>
                                <a href="www.facebook.com"><i class="fa-brands fa-google"></i></a>
                            </div>
                            <div class="col-4">

                            </div>
                            <div class="col-4">
                                <a href="#">View Post</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row recentRow3" style="padding-bottom:10px;">
                    <div class="col-2">
                        <img src="${assetPath(src:'person.jpg')}" alt="photo">
                    </div>
                    <div class="col-10">
                        <div class="row  " style="margin-bottom:-10px;">
                            <div class="col-4">
                                <p>Uday Pratap Singh</p>
                            </div>
                            <div class="col-4">
                                <p>@Uday 5min</p>
                            </div>
                            <div class="col-4 ">
                                <a href="#">Grails</a>
                            </div>
                        </div>

                        <div class="row recentshareContent" style="margin-bottom:-10px;">
                            <p>These are the recent shares posted by the uday pratap singh these is the same as done</p>
                        </div>

                        <div class="row">
                            <div class="col-4 socialMedia">
                                <a href="www.facebook.com"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="www.facebook.com"><i class="fa-brands fa-twitter"></i></a>
                                <a href="www.facebook.com"><i class="fa-brands fa-google"></i></a>
                            </div>
                            <div class="col-4">

                            </div>
                            <div class="col-4">
                                <a href="#">View Post</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


            <!--Post start -->

            <div class="row postRow">
                <div class="row postRow1">
                    <div class="col-4" style="background-color:#8f8989">
                        <h6 style="padding-top:3px;padding-bottom:0spx;">Top Posts</h6>
                    </div>
                    <div class="col-4">
                    </div>
                    <div class="col-4">
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item active" href="#" >Today</a>
                                <a class="dropdown-item" href="#">1 Week</a>
                                <a class="dropdown-item" href="#">1 Month</a>
                                <a class="dropdown-item" href="#">1 year</a>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="row postRow2" style="padding-bottom:10px;">
                    <div class="col-2">
                        <img src="${assetPath(src:'person.jpg')}" alt="photo">
                    </div>
                    <div class="col-10">
                        <div class="row  " style="margin-bottom:-10px;">
                            <div class="col-4">
                                <p>Uday Pratap Singh</p>
                            </div>
                            <div class="col-4">
                                <p>@Uday 5min</p>
                            </div>
                            <div class="col-4 ">
                                <a href="#">Grails</a>
                            </div>
                        </div>

                        <div class="row postContent" style="margin-bottom:-10px;">
                            <p>These are the recent shares posted by the uday pratap singh these is the same as done</p>
                        </div>

                        <div class="row">
                            <div class="col-4 socialMedia">
                                <a href="www.facebook.com"><i class="fa-brands fa-facebook-f"></i></a>
                                <a href="www.facebook.com"><i class="fa-brands fa-twitter"></i></a>
                                <a href="www.facebook.com"><i class="fa-brands fa-google"></i></a>
                            </div>
                            <div class="col-4">

                            </div>
                            <div class="col-4">
                                <a href="">View Post</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <!--Post end -->

        </div>


        <!--login start-->

        <div class="col-5">
            <div class="row loginRow">
                <h6>Login</h6>
                <g:form name="myForm" url="[controller:'Login',action:'login']" >
                    <div class="mb-3 mt-3 d-flex align-items-center">
                        <div class="col-4">
                            <label for="email" class="form-label me-3">Email/Username:</label>
                        </div>
                        <div class="col-8">
                            <input type="email" class="form-control flex-grow-1" id="email" placeholder="Enter email" name="email" required>
                        </div>
                    </div>
                    <div class="mb-2 mt-3 d-flex align-items-center">
                        <div class="col-4">
                            <label for="pwd" class="form-label me-3">Password:</label>
                        </div>
                        <div class="col-8">
                            <input type="password" class="form-control flex-grow-1" id="pwd" placeholder="Enter password" name="password" required>
                        </div>
                    </div>
                    <div class="d-flex p-2 justify-content-between">
                        <button type="button" class="btn btn-link"><g:link controller="Users" action = "forgotPassword">Forgot Password?</g:link></button>
                        <button type="submit" class="btn btn-primary me-2">Login</button>

                    </div>
                </g:form>

            </div>
            <!--login end -->


            <!--Registration start-->
            <div class="row regisRow mt-5">
                <h6>Register</h6>
                <g:form name="myForm" url="[controller:'Login',action:'register']" enctype="multipart/form-data">
                    <div class="mb-3 mt-3 d-flex align-items-center">
                        <div class="col-4">
                            <label for="fname" class="form-label me-3">First name:</label>
                        </div>
                        <div class="col-8">
                            <input type="text" class="form-control flex-grow-1" id="fname"  name="firstName" required>
                        </div>
                    </div>
                    <div class="mb-3 mt-3 d-flex align-items-center">
                        <div class="col-4">
                            <label for="lname" class="form-label me-3">Last name:</label>
                        </div>
                        <div class="col-8">
                            <input type="text" class="form-control flex-grow-1" id="lname"  name="lastName" required>
                        </div>
                    </div>

                    <div class="mb-3 mt-3 d-flex align-items-center">
                        <div class="col-4">
                            <label for="email" class="form-label me-3">Email:</label>
                        </div>
                        <div class="col-8">
                            <input type="email" class="form-control flex-grow-1" id="regemail"  name="email" required>
                        </div>
                    </div>

                    <div class="mb-3 mt-3 d-flex align-items-center">
                        <div class="col-4">
                            <label for="usrname" class="form-label me-3">Username:</label>
                        </div>
                        <div class="col-8">
                            <input type="text" class="form-control flex-grow-1" id="usrname" name="username" required>
                        </div>
                    </div>

                    <div class="mb-2 mt-3 d-flex align-items-center">
                        <div class="col-4">
                            <label for="pwd" class="form-label me-3">Password:</label>
                        </div>
                        <div class="col-8">
                            <input type="password" class="form-control flex-grow-1" id="regpwd" name="password" required>
                        </div>
                    </div>

                    <div class="mb-2 mt-3 d-flex align-items-center">
                        <div class="col-4">
                            <label for="pwd" class="form-label me-3">Confirm Password:</label>
                        </div>
                        <div class="col-8">
                            <input type="password" class="form-control flex-grow-1" id="confRegPwd" name="confirmPassword" required>
                        </div>
                    </div>

                    <div class="mb-2 mt-3 d-flex align-items-center">
                        <div class="col-4">
                            <label for="regPhoto" class="form-label me-3">Photo:</label>
                        </div>
                        <div class="col-8">
                            <input type="file" class="form-control flex-grow-1" id="regPhoto" name="photo" >
                        </div>
                    </div>



                    </div>
                    <div class="row">
                    <p class="col-4">Admin</p>
                    <div class= "col-8">
                    <div>
                            <input type="radio" id="admin"
                                   name="admin" value="True">
                            <label for="True">True</label>
                        </div>

                        <div>
                            <input type="radio" id="admin"
                                   name="admin" value="False">
                            <label for="False">False</label>
                        </div>
                        </div>
                    <div class="row">
                                        <p class="col-4">Active</p>
                                        <div class= "col-8">

                                        <div>
                                                <input type="radio" id="active"
                                                       name="active" value="True">
                                                <label for="True">True</label>
                                            </div>

                                            <div>
                                                <input type="radio" id="active"
                                                       name="active" value="False">
                                                <label for="False">False</label>
                                            </div>
</div></div>
                     <div class="d-flex p-2 justify-content-end">
                      <button type="submit" class="btn btn-primary me-2">Register</button>
                </g:form>
            </div>

            <!--Registration end-->
        </div>



    </div>

    <!--second main row end that includes login registration post recent shares-->

</div>