<%@ page import="linksharing.Subscription" %>
<%@ page import="linksharing.Topic" %>
<%@ page import="linksharing.Resources" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
			integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
			crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
			integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
			crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
		  integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<title>Profile Edit</title>
</head>

<body>
<style>
i {
    font-size: 24px;
}

.nav-search {
    padding: 5px;
}


.profile img {
    width: 94px;
    height: 110px;
    padding: 6px;
}

.profile, .trending {
    border: 2px solid black;
    border-radius: 5px;
    margin: 10px;
    padding: 5px;
}

.subscription {
    border: 2px solid black;
    border-bottom: 0px;
    border-radius: 5px;
    margin: 10px;
    margin-top: 10px;


}

.card1 {
    border-bottom: 2px solid black;
    padding: 5px;
    margin-top: 4px;
}

.subscriptions-head {
    border-bottom: 2px solid black;
    background-color: #8f8989;
    margin: 0px;
}

.search-row {
    border: 2px solid black;
    border-radius: 5px;
    margin: 10px;
    padding: 5px
}

.visible, .seriousness {
    padding-top: 10px
}

@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap");
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
}

body {

    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: white;
}

.popup-container {
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, .3);
    display: flex;
    justify-content: center;
    align-items: center;
    opacity: 0;
    pointer-events: none;
}

.popup-container.active {
    opacity: 1;
    pointer-events: auto;
    transition: .4s ease;
}

.popup-container .popup-box {
    z-index: 9;
    width: 500px;
    background: #f2f2f2;
    border-radius: 6px;
    box-shadow: 0 0 10px rgba(0, 0, 0, .1);
    padding: 30px;
    transform: scale(0);
}

.popup-container.active .popup-box {
    transform: scale(1);
    transition: .4s ease;
    transition-delay: .25s;
}

.popup-box h1 {
    color: #333;
    line-height: 1;
}

.popup-box p {
    color: #333;
    margin: 12px 0 20px;
}

.popup-box .close-btn {
    width: 100%;
    height: 45px;
    background: #6e78ff;
    border-radius: 6px;
    border: none;
    outline: none;
    box-shadow: 0 0 10px rgba(0, 0, 0, .1);
    cursor: pointer;
    font-size: 18px;
    color: #f2f2f2;
    font-weight: 500;
}

.dropdown-toggle::after {
    content: none; /* Remove the additional content */
}

.close-btn {
    width: 40%;
}

.recentRow2 {
    border-bottom: 2px solid black;
    margin: 0px;
}

.profile {
    margin-bottom: 40px;
}

.post {
    border: 2px solid black;
    border-bottom: 0px;
    border-radius: 5px;
    margin-top: 10px;
    overflow: hidden;
}

.post-head {
    border-bottom: 2px solid black;
    margin: 0px;
    background-color: #8f8989;
}

.post-body {
    margin-top: 10px;
    border-bottom: 2px solid black;
    padding: 5px;
}

.profile-form {
    border: 2px solid black;
    border-radius: 5px;
    margin-top: 10px;
    overflow: hidden;
    padding: 10px;
}

</style>

<div class="container">
	<g:render template="/Templates/navbar"></g:render>
	<br>

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

	<div class="row d-flex pr-2 justify-content-between">
		<div class="col-5">
			<div class="row profile">
				<div class="col-4">
					<g:if test="${u.photo}">
						<img src="${createLink(controller: 'dashboard', action: 'fetchImage', params: [id: u.id])}"
							 height="100px" width="90px" style="margin-right: 10px;"/>
					</g:if>
					<g:else>
						<asset:image src="${'images.jpeg'}" style="width:90px; height: 100px"/>
					</g:else>
				</div>

				<div class="col-8">
					<div class="row name"><h4>${u.fullName}</h4></div>

					<div class="row handle">@${u.firstName}</div>

					<div class="row">
						<div class="col-6">Subscriptions</div>

						<div class="col-6">Topics</div>
					</div>

					<div class="row">
						<div class="col-6">${Subscription.createCriteria().list {
							eq('user',u)
							topic {
								eq('deleted',false)
							}
						}?.size()}</div>

						<div class="col-6">${Topic.findAllByUserAndDeleted(u,false)?.size()}</div>
					</div>
				</div>
			</div>

			<div class="subscription">
				<g:render template="/Templates/trendingTopics"></g:render>
			</div>
		</div>


		<div class="col-6">

			<div class="row profile-form regisRow mt-5">
				<div class="row pl-5"><h2>Profile</h2></div>
				<g:form name="myForm" url="[controller: 'Users', action: 'editProfile']" enctype="multipart/form-data">
					<div class="mb-3 mt-3 d-flex align-items-center">
						<div class="col-4">
							<label for="fname" class="form-label me-3">First name:</label>
						</div>

						<div class="col-8">
							<input type="text" class="form-control flex-grow-1" id="fname" name="firstName" value="${u.firstName}" required>
						</div>
					</div>

					<div class="mb-3 mt-3 d-flex align-items-center">
						<div class="col-4">
							<label for="lname" class="form-label me-3">Last name:</label>
						</div>

						<div class="col-8">
							<input type="text" class="form-control flex-grow-1" id="lname" name="lastName" value="${u.lastName}" required>
						</div>
					</div>

					<div class="mb-3 mt-3 d-flex align-items-center">
						<div class="col-4">
							<label for="email" class="form-label me-3">Email:</label>
						</div>

						<div class="col-8">
							<input type="email" class="form-control flex-grow-1" id="regemail" name="email" value="${u.email}" required>
						</div>
					</div>

					<div class="mb-3 mt-3 d-flex align-items-center">
						<div class="col-4">
							<label for="usrname" class="form-label me-3">Username:</label>
						</div>

						<div class="col-8">
							<input type="text" class="form-control flex-grow-1" id="usrname" name="username" value="${u.username}" required>
						</div>
					</div>


					<div class="mb-2 mt-3 d-flex align-items-center">
						<div class="col-4">
							<label for="regPhoto" class="form-label me-3">Photo:</label>
						</div>

						<div class="col-8">
							<input type="file" class="form-control flex-grow-1" id="regPhoto" value="${u.photo}" name="photo">
						</div>
					</div>
					<span class="text-end"><button type="submit" class="btn btn-primary me-2">Update</button></span>
				</g:form>
			</div>
			<br>
			<br>
			<g:form name="myForm" url="[controller: 'Users', action: 'updatePassword']">
				<div class="row profile-form regisRow mt-5 mb-5">
					<label for="password" class="col-md-4 col-form-label text-md-right">New Password</label>

					<div class="col-md-6 p-2">
						<input type="password" id="password" class="form-control" name="password" required>
					</div>


					<label for="password" class="col-md-4 col-form-label text-md-right">Confirm Password</label>

					<div class="col-md-6 p-2">
						<input type="password" id="confirmpassword" class="form-control" name="confirmPassword"
							   required>
					</div>


					<div class="col-md-6 offset-md-4 text-end">
						<button type="submit" class="btn btn-primary">
							Update
						</button>
					</div>
				</div>
			</g:form>
		</div>
	</div>
</div>
<script>
    history.pushState(null, null, location.href);

    // Listen for the 'popstate' event (triggered when the user navigates using the browser's back/forward buttons)
    window.addEventListener('popstate', function(event) {
        // Push a new state again to prevent the user from going back
        history.pushState(null, null, location.href);
    });
</script>
</body>
</html>