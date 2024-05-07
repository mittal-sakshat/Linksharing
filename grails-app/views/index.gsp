<%@ page import="linksharing.Resources; linksharing.Topic" %>
<%@ page import="linksharing.ReadingItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Home Page</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
			crossorigin="anonymous"></script>

	<!-- font awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
		  integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
		  crossorigin="anonymous" referrerpolicy="no-referrer"/>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js"
			integrity="sha512-GWzVrcGlo0TxTRvz9ttioyYJ+Wwk9Ck0G81D+eO63BaqHaJ3YZX9wuqjwgfcV/MrB2PhaVX9DkYVhbFpStnqpQ=="
			crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<style>
.search-row {
    border: 2px solid black;
    border-radius: 15px;
}

.navbar-brand {
    color: blue;
}

#recentShare {
    border: 2px solid black;
    border-radius: 5px;
    margin: 10px;
}

.postRow {
    border: 2px solid black;
    border-radius: 5px;
    margin: 10px;

}

.recentRow2 {
    border-bottom: 2px solid black;
    margin: 0px;
}

.recentRow1, .postRow1 {
    border-bottom: 2px solid black;
    margin: 0px;
}

#recentShare img {
    width: 94px;
    height: 110px;
    padding: 6px;
}

.postRow img {
    width: 94px;
    height: 110px;
    padding: 6px;
}

.loginRow, .regisRow {
    padding-top: 5px;
    border: 2px solid black;
    border-radius: 5px;
    margin: 10px;
}

.loginRow h6 {
    border-bottom: 2px solid black;
    padding-bottom: 7px;
}

.regisRow h6 {
    border-bottom: 2px solid black;
    padding-bottom: 7px;
}

.socialMedia a {
    padding: 3px;
}

.error-message {
    color: red;
    display: none; /* Initially hide the error message */
}

.popup {
    position: relative;
    display: inline-block;
    cursor: pointer;
}

/* The actual popup (appears on top) */
.popup .popuptext {
    visibility: hidden;
    width: 160px;
    background-color: #555;
    color: #fff;
    text-align: center;
    border-radius: 6px;
    padding: 8px 0;
    position: absolute;
    z-index: 1;
    bottom: 125%;
    left: 50%;
    margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
    content: "";
    position: absolute;
    top: 100%;
    left: 50%;
    margin-left: -5px;
    border-width: 5px;
    border-style: solid;
    border-color: #555 transparent transparent transparent;
}

/* Toggle this class when clicking on the popup container (hide and show the popup) */
.popup .show {
    visibility: visible;
    -webkit-animation: fadeIn 1s;
    animation: fadeIn 1s
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}

@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}


</style>

<body>
<div class="container">
	<!--Home page First row     -->
	<div class="row search-row">
		<nav class="navbar ">
			<div class="container-fluid">
				<a class="navbar-brand">Link Sharing</a>

				<form class="d-flex">
					<g:textField required="required" name="search" oninput="checkMaxLength(this, 20)checkMaxLength(this, 20)" class="form-control me-2" style="border:2px solid #aea4a4;border-radius:55rem" type="search"
						   placeholder="Search" aria-label="Search"/>
					<button type="submit"><i class="fas fa-search"></i></button>
				</form>
			</div>
		</nav>

	</div>
<!--second row main that includes registration login post recent shares-->

	<g:if test="${flash.message}">
		<div class="alert alert-success" role="alert">
			${flash.message}
		</div>
		<script>
            setTimeout(function () {
                $('.alert').remove(); // Remove the flash message after a delay
            }, 5000); // Adjust the delay as needed (e.g., 5000 milliseconds = 5 seconds)
		</script>
	</g:if>
	<g:elseif test="${flash.error}">
		<div class="alert alert-info" role="alert">
			${flash.error}
		</div>
		<script>
            setTimeout(function () {
                $('.alert').remove(); // Remove the flash message after a delay
            }, 5000); // Adjust the delay as needed (e.g., 5000 milliseconds = 5 seconds)
		</script>
	</g:elseif>

	<div class="row">
		<div class="col-7">
			<!--Recent shares -->
			<div class="row" id="recentShare">

				%{--			<div>${println(Topic.list())}</div>--}%
				<g:render template="/Templates/recentShare"></g:render>
			</div>

			<div class="row">

			</div>

			<!--Post start -->

			<div class="row postRow" id="topPost">
				<g:render template="/Templates/topPosts"></g:render>
			</div>

			<!--Post end -->

		</div>

		<!--login start-->

		<div class="col-5">
			<div class="row loginRow">
				<h6>Login</h6>
				<g:form name="myForm" url="[controller: 'Login', action: 'login']">
					<div class="mb-3 mt-3 d-flex align-items-center">
						<div class="col-4">
							<label for="email" class="form-label me-3">Email/Username:</label>
						</div>

						<div class="col-8">
							<input required="required" oninput="checkMaxLength(this, 50)"  class="form-control flex-grow-1" id="email1" type="email"
								   placeholder="Enter email"
								   name="email1" />
							<span id="email1-error" class="error-message email-error">Please enter a valid email address</span>
						</div>
					</div>

					<div class="mb-2 mt-3 d-flex align-items-center">
						<div class="col-4">
							<label for="pwd" class="form-label me-3">Password:</label>
						</div>

						<div class="col-8">
							<g:passwordField required="required" oninput="checkMaxLength(this, 20)"  class="form-control flex-grow-1" id="pwd"
								   placeholder="Enter password"
								   name="password" />
						</div>
					</div>

					<div class="d-flex p-2 justify-content-between">
						<button type="button" class="btn btn-link"><g:link controller="Users"
																		   action="forgotPassword">Forgot Password?</g:link></button>
						<button type="submit" class="btn btn-primary me-2">Login</button>

					</div>
				</g:form>

			</div>
			<!--login end -->


			<!--Registration start-->
		<div class="row regisRow mt-5">
			<h6>Register</h6>
			<g:form name="myForm" url="[controller: 'Login', action: 'register']" enctype="multipart/form-data">
				<div class="mb-3 mt-3 d-flex align-items-center">
					<div class="col-4">
						<label for="fname" class="form-label me-3">First name:</label>
					</div>

					<div class="col-8">
						<g:textField required="required" oninput="checkMaxLength(this, 256)" type="text" class="form-control flex-grow-1"  name="firstName" maxlength="256" />
						<span id="firstName-error" class="error-message">Maximum limit reached</span>
					</div>
				</div>

				<div class="mb-3 mt-3 d-flex align-items-center">
					<div class="col-4">
						<label for="lname" class="form-label me-3">Last name:</label>
					</div>

					<div class="col-8">
						<g:textField required="required" oninput="checkMaxLength(this, 256)" type="text" class="form-control flex-grow-1"  name="lastName" maxlength="256" />
						<span id="lastName-error" class="error-message">Maximum limit reached</span>
					</div>
				</div>

				<div class="mb-3 mt-3 d-flex align-items-center">
					<div class="col-4">
						<label for="email" class="form-label me-3">Email:</label>
					</div>

					<div class="col-8">
						<input required="required" oninput="checkMaxLength(this, 50)"  class="form-control flex-grow-1" id="email" type="email"
							   name="email" />
						<span  id="email-error" class="error-message email-error">Please enter a valid email address</span>
					</div>
				</div>

				<div class="mb-3 mt-3 d-flex align-items-center">
					<div class="col-4">
						<label for="usrname" class="form-label me-3">Username:</label>
					</div>

					<div class="col-8">
						<g:textField required="required" oninput="checkMaxLength(this, 50)" class="form-control flex-grow-1"  name="username" maxlength="50"/>
						<span id="username-error" class="error-message">Maximum limit reached</span>
					</div>
				</div>

				<div class="mb-2 mt-3 d-flex align-items-center">
					<div class="col-4">
						<label for="pwd" class="form-label me-3" >Password:</label>
					</div>

					<div class="col-8">
						<g:passwordField required="required" oninput="checkMaxLength(this, 20,5)" class="form-control flex-grow-1"  name="password" maxlength="20" minlength="5" id="password"
							    />
						<span id="password-error" class="error-message">Maximum limit reached</span>
						<span id="password-error1" class="error-message">Minimum 5 characters required !</span>
					</div>
				</div>

				<div class="mb-2 mt-3 d-flex align-items-center">
					<div class="col-4">
						<label for="pwd" class="form-label me-3">Confirm Password:</label>
					</div>

					<div class="col-8">
						<g:passwordField required="required" oninput="checkMaxLength(this, 20)" class="form-control flex-grow-1"
							   name="confirmPassword" maxlength="20" minlength="5" id="confirmPassword"
							  />

						<span id="confirmPassword-error" class="error-message">Passwords do not match</span>
					</div>
				</div>


				<div class="mb-2 mt-3 d-flex align-items-center">
					<div class="col-4">
						<label for="regPhoto" class="form-label me-3">Photo:</label>
					</div>

					<div class="col-8">
						<input type="file" oninput="validateFile()" id="photo" name="photo" accept="image/png, image/jpeg, image/jpg" />
						<span id="photo-error" class="error-message">Only jpeg, jpg ,png supported</span>
					</div>
				</div>

				<div class="mb-2 mt-3 d-flex align-items-center">
					<div class="col-4">
						<label for="pwd" class="form-label me-3">Admin Key</label>
					</div>

					<div class="col-8">
						<g:passwordField oninput="checkMaxLength(this, 20)" class="form-control flex-grow-1" id="key"
							   name="key"/>
						<span  class="error-message">Maximum limit reached</span>
					</div>
				</div>



				</div>
%{--				<div class="row">--}%
%{--				<p class="col-4">Admin</p>--}%
%{--				<div class= "col-8">--}%
%{--				<div>--}%
%{--						<g:textField required="required" oninput= type="radio" id="admin"--}%
%{--							   name="admin" value="True">--}%
%{--						<label for="True">True</label>--}%
%{--					</div>--}%

%{--					<div>--}%
%{--						<g:textField required="required" oninput= type="radio" id="admin"--}%
%{--							   name="admin" value="False">--}%
%{--						<label for="False">False</label>--}%
%{--					</div>--}%
%{--					</div>--}%
%{--				<div class="row">--}%
%{--									<p class="col-4">Active</p>--}%
%{--									<div class= "col-8">--}%

%{--									<div>--}%
%{--											<g:textField required="required" oninput= type="radio" id="active"--}%
%{--												   name="active" value="True">--}%
%{--											<label for="True">True</label>--}%
%{--										</div>--}%

%{--										<div>--}%
%{--											<g:textField required="required" oninput= type="radio" id="active"--}%
%{--												   name="active" value="False">--}%
%{--											<label for="False">False</label>--}%
%{--										</div>--}%
%{--	</div>--}%
%{--	</div>--}%
				 <div class="d-flex p-2 justify-content-end">
				  <button type="submit" class="btn btn-primary me-2">Register</button>
			</g:form>
		</div>

			<!--Registration end-->
		</div>

		</div>
	</div>
	<!--second main row end that includes login registration post recent shares-->

</div>
<script>


    var passwordInput = document.getElementById('password');
    var confirmPasswordInput = document.getElementById('confirmPassword');
    var passwordError = document.getElementById('confirmPassword-error');

	console.log(confirmPasswordInput)
    function validatePasswords() {
        var password = passwordInput.value;
        var confirmPassword = confirmPasswordInput.value;

        if (password !== confirmPassword) {
            passwordError.style.display = 'block';
        } else {
            passwordError.style.display = 'none';
        }
    }

    confirmPasswordInput.addEventListener('input', validatePasswords);



    var emailInputs = document.querySelectorAll('input[type="email"]');
    var emailErrors = document.querySelectorAll('.email-error');

    emailInputs.forEach(function(input, index) {
        input.addEventListener('input', function(event) {
            console.log(index,input)
			console.log(emailErrors,emailInputs)
            if (input.validity.valid) {
                emailErrors[index].style.display = 'none';
            } else {
                emailErrors[index].style.display = 'block';
            }
        });
    });

    function validateFile() {
        var fileInput = document.getElementById('photo');
        var errorMessageElement = document.getElementById('photo-error');
        var allowedTypes = ['image/png', 'image/jpeg', 'image/jpg'];
        var file = fileInput.files[0];

        if (file) {
            if (!allowedTypes.includes(file.type)) {
                errorMessageElement.style.display = 'block';
                fileInput.value = ''; // Clear the file input
            } else {
                errorMessageElement.style.display = 'none';
            }
        }

        var fileInput = document.getElementById('photo');
        var file = fileInput.files[0]; // Assuming single file selection

        if (file) {
            var fileSize = file.size; // Size in bytes

            // Check file size (example: maximum size of 5MB)
            var maxSizeInBytes = 5 * 1024 * 1024; // 5MB
            if (fileSize > maxSizeInBytes) {
                document.getElementById('photo-error').textContent = 'File size exceeds 5MB';
                document.getElementById('photo-error').style.display = 'block'
                fileInput.value = ''; // Clear the file input
                return;
            }else{
                document.getElementById('photo-error').style.display = 'none'
			}

            // If file size is within the limit, you can proceed with other actions
            // For example, if you need to display the file size, you can do something like this:
            // console.log('File size: ' + fileSize + ' bytes');
        }
    }


    function checkMaxLength(input, maxLength,minLength) {
        console.log(input)
        var errorMessageId = input.name + "-error";
        var errorMessageElement = document.getElementById(errorMessageId);
        var errorMessageElement1 = document.getElementById('password-error1');

        if (input.value.length >= maxLength) {
            input.value = input.value.substring(0, maxLength); // Truncate the g:textField required="required" oninput= value
            errorMessageElement.style.display = "block"; // Show the error message
        }else if(input.value.length < minLength){
            errorMessageElement1.style.display = "block";
		}
        else {
            errorMessageElement.style.display = "none"; // Hide the error message
            errorMessageElement1.style.display = "none"; // Hide the error message
        }
    }




    function myFunction(id) {
        console.log();
        var popup = document.getElementById(id.children[0].id);
        console.log(popup)
        popup.classList.toggle("show");
    }

    function nextr() {
        var x = document.getElementById('abc')
        console.log(x.value)
        $.ajax({
            type: 'GET',
            url: '/Login/nextPageRecentShare',
            data: {
                page: Number(x.value) + 1
            },
            success: function (data) {
                $('#recentShare').html(data)
                console.log($('.recentShare').html(data))
            }
        });
    }

    function previousr() {
        var x = document.getElementById('bcd')
        console.log(x.value)
        $.ajax({
            type: 'GET',
            url: '/Login/nextPageRecentShare',
            data: {
                page: Number(x.value) - 1
            },
            success: function (data) {
                $('#recentShare').html(data)
                console.log($('.recentShare').html(data))
            }
        });
    }

    function previousp() {
        var x = document.getElementById('cde')
        console.log(x.value)
        $.ajax({
            type: 'GET',
            url: '/Login/nextPageTopPost',
            data: {
                page: Number(x.value) - 1
            },
            success: function (data) {
                $('#topPost').html(data)
            }
        });
    }

    function nextp() {
        var x = document.getElementById('def')
        console.log(x.value)
        $.ajax({
            type: 'GET',
            url: '/Login/nextPageTopPost',
            data: {
                page: Number(x.value) + 1
            },
            success: function (data) {
                $('#topPost').html(data)
            }
        });
    }

    history.pushState(null, null, location.href);

    // Listen for the 'popstate' event (triggered when the user navigates using the browser's back/forward buttons)
    window.addEventListener('popstate', function(event) {
        // Push a new state again to prevent the user from going back
        history.pushState(null, null, location.href);
    });


    function validateSize() {
        var fileInput = document.getElementById('photo');
        var file = fileInput.files[0]; // Assuming single file selection

        if (file) {
            var fileSize = file.size; // Size in bytes

            // Check file size (example: maximum size of 5MB)
            var maxSizeInBytes = 5 * 1024 * 1024; // 5MB
            if (fileSize > maxSizeInBytes) {
                document.getElementById('photo-error').textContent = 'File size exceeds 5MB';
                fileInput.value = ''; // Clear the file input
                return;
            }

            // If file size is within the limit, you can proceed with other actions
            // For example, if you need to display the file size, you can do something like this:
            // console.log('File size: ' + fileSize + ' bytes');
        }
    }


</script>

</body>
</html>