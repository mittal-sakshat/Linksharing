<%@ page import="linksharing.Subscription" %>
<%@ page import="linksharing.Topic" %>
<%@ page import="linksharing.Users" %>
<%@ page import="linksharing.ReadingItem" %>
<%@ page import="linksharing.Resources" %>
<!doctype html>
<html lang="en">
<head>
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
	<title>Dashboard</title>
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


.error-message {
    color: red;
    display: none; /* Initially hide the error message */
}

#subscription, #subscription1 {
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

</style>


<div class="container">
	<!--Home page First row     -->

	<g:render template="/Templates/navbar"></g:render>
	<g:if test="${flash.message}">
		<div class="alert alert-success" role="alert" id="flash">
			${flash.message}
		</div>
		<script>
            setTimeout(function () {
                $('.alert').remove();
            }, 5000);
		</script>
	</g:if>
	<g:elseif test="${flash.error}">
		<div class="alert alert-info" role="alert">
			${flash.error}
		</div>
		<script>
            setTimeout(function () {
                $('.alert').remove();
            }, 5000);
		</script>
	</g:elseif>

	<div class="row d-flex pr-2 justify-content-between">
		<div class="col-5">
			<div class="row profile">
				<g:render template="/Templates/profile"></g:render>
			</div>

			<div id="subscription">
				<g:render template="/Templates/subscription"></g:render>
			</div>

			<div id="subscription1">
				<g:render template="/Templates/trendingTopics"></g:render>
			</div>
		</div>

		<div class="col-6">

			<div class="post" id="posts">
				<div class="row post-head d-flex justify-content-between">
					<div class="col-6">
						Inbox
					</div>

					<div class="col-4 ">
					%{--						<form class="d-flex">--}%
					%{--							<input class="form-control me-2" style="border:2px solid #aea4a4;border-radius:55rem"--}%
					%{--								   type="search" placeholder="Search" aria-label="Search">--}%
					%{--							<i class="bi bi-search"></i>--}%
					%{--						</form>--}%
						<g:form controller="Search" action="search" method="get" class="d-flex justify-content-centre">
							<input class="form-control me-2" style="border:2px solid #aea4a4;border-radius:55rem"
								   type="search" placeholder="Search" aria-label="Search" name="query">
							<button class="btn btn-primary" type="submit">Search</button>
						</g:form>
					</div>

				</div>

				<g:each in="${li.reverse()}" var="i">
					<g:if test="${i.deleted == false}">
						<div class="row post-body">
							<div class="col-3" style="padding-left:20px">
								<a href="${createLink(controller: 'Users', action: 'profile')}">
									<g:if test="${i.user.photo}">

										<img src="${createLink(controller: 'dashboard', action: 'fetchImage', params: [id: i.user.id])}"
											 height="100px" width="90px" style="margin-right: 10px;"/>
									</g:if>
									<g:else>
										<asset:image src="${'images.jpeg'}" style="width:90px; height: 100px"/>
									</g:else>
								</a>
							</div>

							<div class="col-9" style="padding-left:0px;">
								<div class="row">${i.description.size()>100 ? i.description.substring(0,100) : i.description }</div>

								<div class="row">
									<div class="col-4">
										<i class="bi bi-facebook"></i>
										<i class="bi bi-twitter"></i>
										<i class="bi bi-google"></i>
									</div>
									<g:if test="${i.filePath != null}">
										<div class="col-2 ft-s"><a
												href="${createLink(controller: 'Resources', action: 'downloadFile', params: [id: i.id])}"
												target="_blank">download</a></div>
									</g:if>
									<g:if test="${i.url != null}">
										<div class="col-2 ft-s"><a
												href="#" onclick="openLink('${i.url}'); return false;"
												>site</a></div>
									</g:if>
								<div class=" col-2 ft-s "><a
										href="${createLink(controller: 'Resources', action: 'mark', params: [id: i.id])}">mark</a>
								</div>

									<div class="col-2 ft-s"><a
											href="${createLink(controller: 'Resources', action: 'createResource', params: [id: i.id])}">view post</a>
									</div>
								</div>
							</div>
						</div>
					</g:if>
				</g:each>

			</div>
		</div>
	</div>
</div>

<script>

    function openLink(url) {
        if (!/^https?:\/\//i.test(url)) {
            // If not, prepend it with 'http://' or 'https://', depending on your needs
            url = 'http://' + url; // You can change this to 'https://' if needed
        }

        console.log(url)
        window.open(url, '_blank');
    }

    function next1() {
        var x = document.getElementById('abc')
        console.log(x.value)
        $.ajax({
            type: 'GET',
            url: '/Search/nextPage',
            data: {
                page: Number(x.value) + 1
            },
            success: function (data) {
                $('#posts').html(data)
                // console.log($('.recentShare').html(data))
            }
        });
    }


    history.pushState(null, null, location.href);

    // Listen for the 'popstate' event (triggered when the user navigates using the browser's back/forward buttons)
    window.addEventListener('popstate', function(event) {
        // Push a new state again to prevent the user from going back
        history.pushState(null, null, location.href);
    });


    function validateFile() {
    var fileInput = document.getElementById('fileInput');
    var file = fileInput.files[0]; // Assuming single file selection


    if (file) {
        var fileSize = file.size; // Size in bytes

        // Check file size (example: maximum size of 5MB)
        var maxSizeInBytes = 5 * 1024 * 1024; // 5MB
        if (fileSize > maxSizeInBytes) {
            document.getElementById('filePath-error').textContent = 'File size exceeds 5MB';
            document.getElementById('filePath-error').style.display = 'block'
            fileInput.value = ''; // Clear the file input
            return;
        }else{
            document.getElementById('filePath-error').style.display = 'none'
        }

        // If file size is within the limit, you can proceed with other actions
        // For example, if you need to display the file size, you can do something like this:
        // console.log('File size: ' + fileSize + ' bytes');
    }
    }
</script>

</body>
</html>