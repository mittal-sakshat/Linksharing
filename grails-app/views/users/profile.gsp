<%@ page import="linksharing.Resources; linksharing.Subscription" %>
<%@ page import="linksharing.Topic" %>
<%@ page import="linksharing.ReadingItem" %>
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
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<title>Profile</title>
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
    margin: 2px;
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
    margin-bottom: 20px;
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


.handle-head {
    color: grey;
}

/*.subscription {*/
/*    border: 2px solid black;*/
/*    border-bottom: 0px;*/
/*    border-radius: 5px;*/
/*    margin: 10px;*/
/*    margin-top: 10px;*/

/*}*/

.subscriptions-head {
    border-bottom: 2px solid black;
    background-color: #8f8989;
    margin: 0px;
}

.profile-body, .profile-head, .topic-head, .post-head, .subscription-head {
    border-bottom: 2px solid black;
    margin: 0px;
}

i {
    font-size: 24px;
}

.topic, .profile, .post, .subscription {
    border: 2px solid black;
    border-radius: 5px;
}

.topic {
    margin-bottom: 10px;
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
    padding-left: 20px;
}

.ft-s {
    font-size: 10px
}

.post-body img {
    width: 94px;
    height: 110px;
}

.topic-head, .profile-head, .post-head, .subscription-head {
    background-color: #8f8989;
}

/*.topic-body{*/
/*	border-bottom: 2px solid black;*/
/*	overflow: hidden;*/
/*}*/

.card1 {
    padding: 5px;
    margin-top: 4px;
}
</style>

<div class="container">
	<g:render template="/Templates/navbar"></g:render>
	<br>

	<div class="row d-flex pr-2 justify-content-between">
		<div class="col-5">

			<div class="row profile" id="profile">
				<g:render template="/Templates/profile"></g:render>
			</div>

			<br>

			<div class="topic">
				<div class="row topic-head">
					Topic
				</div>
				<g:each in="${Topic.list()}" var="i">
				%{--					println(${i.visibility})--}%
				%{--					&& i.visibility == linksharing.Topic.Visibility.Public--}%
					<g:if test="${session.user1.id == i.user.id && i.deleted == false}">
						<div class="card1">
							<div class="row topic-body">
								<div class="col-4">
									<g:if test="${i.user.photo}">
										<img src="${createLink(controller: 'dashboard', action: 'fetchImage', params: [id: i.user.id])}"
											 height="100px" width="90px" style="margin-right: 10px;"/>
									</g:if>
									<g:else>
										<asset:image src="${'images.jpeg'}" style="width:90px; height: 100px"/>
									</g:else>
								</div>

								<div class="col-8">
									<div class="row name">
										<div class="col-6"><a
												href="${createLink(controller: 'Topic', action: 'index')}?params=${i.id}">${i.name}</a>
										</div>

										<div class="col-6" style="color:grey">(${i.visibility})</div>
									</div>

									<div class="row handle-head">
										<div class="col-4">@${i.user.firstName}</div>

										<div class="col-4">Subscriptions</div>

										<div class="col-4 ">Post</div>
									</div>

									<div class="row">
										<div class="col-4"></div>

										<div class="col-4">${Subscription.findAllByTopic(i).size()}</div>

										<div class="col-4">${linksharing.Resources.findAllByTopicAndDeleted(i, false).size()}</div>
									</div>

								</div>
							</div>

							<div class="row">
								<div class="col-4 seriousness">
									<g:if test="${u.id == i?.user?.id || u.admin == true}">
										<g:select id="seriousTop${i.id}" from="['Serious', 'Casual', 'Very_Serious']"
												  name="selectedTopic" data="${i.id}"
												  value="${Subscription?.findByTopicAndUser(i, u)?.seriousness}"
												  onchange="serious(this.id, this)">
										</g:select>
									</g:if>
									%{--								<select id="seriousTop" name="serious">--}%
									%{--									<option value="very-serious">very serious</option>--}%
									%{--									<option value="serious">serious</option>--}%
									%{--									<option value="Less serious">Less serious</option>--}%
									%{--								</select>--}%
								</div>

								<div class="col-3 visible">
									<g:if test="${u.id == i?.user?.id || u.admin == true}">
										<g:select id="visiblityTop${i.id}" from="['Public', 'Private']"
												  name="selectedTopic"
												  data="${i.id}" value="${i.visibility}" onchange="visi(this.id, this)">
										</g:select>
									</g:if>
									%{--									<select id="visiblityTop" name="visiblity" data="${i.id}" onchange="rate(this.id,this)" value="${i.visibility}">--}%
									%{--										<option value="Public">Public</option>--}%
									%{--										<option value="Private">Private</option>--}%
									%{--									</select>--}%
								</div>

								<div class="col-5">
									<g:if test="${u.id == i?.user?.id || u.admin == true}">

%{--										<i class="bi bi-envelope nav-search"></i>--}%

									</g:if>
								</div>
							</div>
						</div>
					</g:if>
				</g:each>
			</div>


			<div class="topic">
				<g:render template="/Templates/subscription"></g:render>
			</div>
		</div>

		<div class="col-1"></div>

		<div class="col-6">

			<div class="post" id="posts">
				%{--				<div class="row post-head d-flex justify-content-between">--}%
				%{--					<div class="col-6">--}%
				%{--						Inbox--}%
				%{--					</div>--}%

				%{--					<div class="col-4 ">--}%
				%{--						<form class="d-flex">--}%
				%{--							<input class="form-control me-2" style="border:2px solid #aea4a4;border-radius:55rem"--}%
				%{--								   type="search" placeholder="Search" aria-label="Search">--}%
				%{--							<i class="bi bi-search"></i>--}%
				%{--						</form>--}%
				%{--					</div>--}%

				%{--				</div>--}%
				%{--				<g:render template="/Templates/posts"></g:render>--}%
				%{--				<div class="row post-head">--}%
				%{--					<div class="col-6">--}%
				%{--						--}%%{--		Posts: "${t.name}"--}%
				%{--						Posts--}%
				%{--					</div>--}%

				%{--					<div class="col-4 justify-content-centre">--}%
				%{--						<form class="d-flex">--}%
				%{--							<input class="form-control me-2" style="border:2px solid black;border-radius:55rem"--}%
				%{--								   type="search" placeholder="Search" aria-label="Search">--}%
				%{--							<i class="bi bi-search"></i>--}%
				%{--						</form>--}%
				%{--					</div>--}%
				%{--				</div>--}%
				<g:render template="/Templates/posts"></g:render>
				%{--				<g:each in="${li}" var="i">--}%
				%{--				--}%%{--					println(${i.readingItems})--}%
				%{--				--}%%{--					${}--}%
				%{--				--}%%{--					<g:each in="${i.readingItems}" var="j">--}%
				%{--				--}%%{--						println(${j.isRead})--}%
				%{--				--}%%{--						println(${j.user.id == session.user1.id})--}%

				%{--				--}%%{--						<g:if test="${(j.user.id == session.user1.id && j.isRead == false)}">--}%

				%{--					<div class="row post-body">--}%
				%{--						<div class="col-3" style="padding-left:20px">--}%
				%{--							<a href="${createLink(controller: 'Users', action: 'profile')}">--}%
				%{--								<g:if test="${i.user.photo}">--}%
				%{--									<img src="${createLink(controller: 'dashboard', action: 'fetchImage', params: [id: i.user.id])}"--}%
				%{--										 height="100px" width="90px" style="margin-right: 10px;"/>--}%
				%{--								</g:if>--}%
				%{--								<g:else>--}%
				%{--									<asset:image src="${'user.png'}" style="width:90px; height: 100px"/>--}%
				%{--								</g:else>--}%
				%{--							</a>--}%
				%{--						</div>--}%

				%{--						<div class="col-9" style="padding-left:0px;">--}%
				%{--							<div class="row">${i.description}</div>--}%

				%{--							<div class="row">--}%
				%{--								<div class="col-4">--}%
				%{--									<i class="bi bi-facebook"></i>--}%
				%{--									<i class="bi bi-twitter"></i>--}%
				%{--									<i class="bi bi-google"></i>--}%
				%{--								</div>--}%
				%{--								<g:if test="${i.filePath != null}">--}%
				%{--									<div class="col-2 ft-s"><a href="#">download</a></div>--}%
				%{--								</g:if>--}%
				%{--								<g:if test="${i.url != null}">--}%
				%{--									<div class="col-2 ft-s"><a--}%
				%{--											href="${createLink(absolute: true, uri: "${i.url}")}"--}%
				%{--											target="_blank">site</a></div>--}%
				%{--								</g:if>--}%
				%{--								<div class="col-2 ft-s"><a--}%
				%{--										href="${createLink(controller: 'Resources', action: 'mark', params: [id: i.id])}">mark</a>--}%
				%{--								</div>--}%

				%{--								<div class="col-2 ft-s"><a--}%
				%{--										href="${createLink(controller: 'Resources', action: 'index', params: [id: i.id])}">view post</a>--}%
				%{--								</div>--}%
				%{--							</div>--}%
				%{--						</div>--}%
				%{--					</div>--}%
				%{--				</g:each>--}%
			</div>
		</div>
	</div>

</div>
<script>

    function visi(e, b) {
        console.log(b.getAttribute("data"))
        console.log($('.subscription'))
        var selectedElement = document.getElementById(e)
        console.log(selectedElement.value)
        // e.preventDefault();
        $.ajax({
            type: 'GET',
            url: '/Dashboard/visi',
            data: {
                var1: b.value,
                tId: b.getAttribute("data")
            },
            success: function (data) {
                console.log(data);

                // your code
            }
        });
    }

    function serious(e, b) {
        console.log(b.getAttribute("data"))
        console.log($('.subscription'))
        var selectedElement = document.getElementById(e)
        console.log(selectedElement.value)
        // e.preventDefault();
        $.ajax({
            type: 'GET',
            url: '/Dashboard/serious',
            data: {
                var1: b.value,
                tId: b.getAttribute("data")
            },
            success: function (data) {
                console.log(data);

                // your code
            }
        });
    }


    function nextPost() {
        var x = document.getElementById('efg')
        var y = document.getElementById('fgh')
        console.log(x.value)
        $.ajax({
            type: 'GET',
            url: '/Search/searchPost',
            data: {
                page: Number(x.value) + 1,
                query: y.value
            },
            success: function (data) {
                console.log(data)
                $('#posts').html(data)
// console.log($('.recentShare').html(data))
            }
        });
    }

    function previousPost() {
        var x = document.getElementById('ijk')
        var y = document.getElementById('lnm')
        console.log(x.value)
        $.ajax({
            type: 'GET',
            url: '/Search/searchPost',
            data: {
                page: Number(x.value) - 1,
                query: y.value
            },
            success: function (data) {
                console.log(data)
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
</script>

</body>
</html>