<%@ page import="linksharing.Subscription" %>
<%@ page import="linksharing.Topic" %>
<%@ page import="linksharing.Users" %>
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
	<title>Topics</title>
</head>

<body>

<style>
.handle-head {
    color: grey;
}

.profile-body, .profile-head, .topic-head, .post-head {
    border-bottom: 2px solid black;
    margin: 0px;
}

i {
    font-size: 24px;
}

.topic, .profile, .post {
    border: 2px solid black;
    border-radius: 5px;
}

img {
    width: 94px;
    height: 110px;
    padding: 6px;
}

.search-row {
    border: 2px solid black;
    border-radius: 5px;
    margin: 10px;
    padding: 5px
}

.dropdown-toggle::after {
    content: none; /* Remove the additional content */
}

.seriousness {
    padding: 10px;
}

.ft-s {
    font-size: 10px
}

.post-body img {
    width: 94px;
    height: 110px;
}

.topic-head, .profile-head, .post-head {
    background-color: #8f8989;
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

	<div class="container">
		<nav class="navbar spacing et navbar-light bg-dark">
			<div class="container col-lg-6">
				<a href="#">Users</a>
			</div>

			<div class="col-lg-6">
				<select class="box" id="selectuser" name="selectuser" onclick="this.form.submit()">
					<g:each in="${Users.list()}" var="i">
						<option>${i.firstName.size() > 15 ? i.firstName.substring(0,15)+"..." : i.firstName}</option>
					</g:each>
				</select>
			</div>
		</nav>
		<table class="table table-stripped table-bordered" id="myTable">
			<thead>
			<tr>
				<th scope="col" onclick="w3.sortHTML('#myTable', '.item', 'td:nth-child(1)')"
					style="cursor:pointer">Id</th>
				<th scope="col" onclick="w3.sortHTML('#myTable', '.item', 'td:nth-child(1)')"
					style="cursor: pointer;">UserName</th>
				<th scope="col" onclick="w3.sortHTML('#myTable', '.item', 'td:nth-child(1)')"
					style="cursor: pointer">Email</th>
				<th scope="col" onclick="w3.sortHTML('#myTable', '.item', 'td:nth-child(1)')"
					style="cursor: pointer">FirstName</th>
				<th scope="col" onclick="w3.sortHTML('#myTable', '.item', 'td:nth-child(1)')"
					style="cursor: pointer">LastName</th>
				<th scope="col" onclick="w3.sortHTML('#myTable', '.item', 'td:nth-child(1)')"
					style="cursor: pointer">Active</th>
				<th scope="col" onclick="w3.sortHTML('#myTable', '.item', 'td:nth-child(1)')"
					style="cursor: pointer">Manage</th>
			</tr>
			</thead>
			<tbody>
			<g:each in="${Users.list()}" var="i">
				<tr class="item">
					<td>${i.id}</td>
					<td>${i.username.size() > 15 ? i.username.substring(0,15)+"..." : i.username}</td>
					<td>${i.email.size() > 15 ? i.email.substring(0,15)+"..." : i.email}</td>
					<td>${i.firstName.size() > 15 ? i.firstName.substring(0,15)+"..." : i.firstName}</td>
					<td>${i.lastName.size() > 15 ? i.lastName.substring(0,15)+"..." : i.lastName}</td>
					<g:if test="${i.active}">
						<td>Yes</td>
						<td>
							<g:if test="${!i.admin}">
								<g:link controller="admin" action="deactivate" params="[id: i.id]">Deactivate</g:link>
							</g:if>
						</td>
					</g:if>
					<g:else>
						<td>No</td>
						<td><g:link controller="admin" action="activate" params="[id: i.id]">Activate</g:link></td>
					</g:else>
				</tr>
			</g:each>
			</tbody>
		</table>
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


