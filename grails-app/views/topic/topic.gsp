<%@ page import="linksharing.Subscription" %>
<%@ page import="linksharing.Topic" %>
<%@ page import="linksharing.Resources" %>
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
            setTimeout(function() {
                $('.alert').remove(); // Remove the flash message after a delay
            }, 5000); // Adjust the delay as needed (e.g., 5000 milliseconds = 5 seconds)
		</script>
	</g:if>

	<div class="row">
		<div class="col-5">
			<div class="row topic">
				<div class="row topic-head">
					Topic: ${t.name.size() > 15 ? t.name.substring(0,15)+"..." : t.name}
				</div>
				<g:hiddenField name="abc" value="${t.id}" id="456"></g:hiddenField>
				<div class="row topic-body">
					<div class="col-4">
						<g:if test="${t.user.photo}">
							<img src="${createLink(controller: 'dashboard', action: 'fetchImage', params: [id: t.user.id])}"
								 height="100px" width="90px" style="margin-right: 10px;"/>
						</g:if>
						<g:else>
							<asset:image src="${'images.jpeg'}" style="width:90px; height: 100px"/>
						</g:else>
					</div>

					<div class="col-8">
						<div class="row name">
							<div class="col-6"><a
									href="${createLink(controller: 'Topic', action: 'index')}?params=${t.id}">${t.name.size() > 15 ? t.name.substring(0,15)+"..." : t.name}</a>
							</div>

							<div class="col-6" style="color:grey">(${t.visibility})</div>
						</div>

						<div class="row handle-head">
							<div class="col-4">@${t.user.username}</div>

							<div class="col-4">Subscriptions</div>

							<div class="col-4 ">Post</div>
						</div>

						<div class="row">
							<div class="col-4">
								<g:if test="${Subscription.findByTopicAndUser(t, u) == null}">
									<div class="col-4"><a
											href="${createLink(controller: 'Subscription', action: 'subscribe', params: [u: u.id, t: t.id])}">Subscribe</a>
									</div>
								</g:if>
								<g:else>
									<div class="col-4"><a
											href="${createLink(controller: 'Subscription', action: 'unSubscribe', params: [u: u.id, t: t.id, flag: 1])}">Unsubscribe</a>
									</div>
								</g:else>
							</div>

							<div class="col-4">${Subscription.findAllByTopic(t).size()}</div>

							<div class="col-4">${Resources.findAllByTopicAndDeleted(t, false).size()}</div>
						</div>

						<div class="row">
							<div class="col-5 seriousness">
								<g:if test="${u.id == t?.user?.id}">
									<g:select id="visiblityTop${t.id}" from="['Public', 'Private']"
											  name="selectedTopic"
											  data="${t.id}" value="${t.visibility}"
											  onchange="visi(this.id, this)" class="ldinsd">
									</g:select>
								</g:if>
								%{--                                <select id="serious" name="serious">--}%
								%{--                                    <option value="serious">serious</option>--}%
								%{--                                    <option value="very-serious">very serious</option>--}%
								%{--                                    <option value="Less serious">Less serious</option>--}%
								%{--                                </select>--}%
							</div>

							<div class="col-7">
								<i class="bi bi-envelope nav-search"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<br>
			<br>

			<div class="row profile">
				<div class="row profile-head">
					Users: "${t.name.size() > 15 ? t.name.substring(0,15)+"..." : t.name}"
				</div>
				<g:each in="${Subscription.findAllByTopic(t)}" var="i">

					<div class="row profile-body">
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
							<div class="row name"><h4>${i.user.fullName.size() > 15 ? i.user.fullName.substring(0,15) + "..." : i.user.fullName}</h4></div>

							<div class="row handle">@${i.user.firstName.size() > 15 ? i.user.firstName.substring(0,15)+"..." : i.user.firstName}</div>

							<div class="row">
								<div class="col-6">Subscriptions</div>

								<div class="col-6">Posts</div>
							</div>

							<div class="row">
								<div class="col-6">${Subscription.createCriteria().list {
									eq('user',i.user)
									topic {
										eq('deleted',false)
									}
								}?.size()}</div>

								<div class="col-6">${Resources.findAllByUserAndDeleted(i.user,false).size()}</div>
							</div>

						</div>
					</div>
				</g:each>

			</div>
		</div>

		<div class="col-1"></div>

		<div class="col-6">
			<div class="row post" id="posts">
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
%{--				<g:each in="${posts}" var="i">--}%
%{--				--}%%{--					println(${i.readingItems})--}%
%{--				--}%%{--					${}--}%
%{--				--}%%{--					<g:each in="${i.readingItems}" var="j">--}%
%{--				--}%%{--						println(${j.isRead})--}%
%{--				--}%%{--						println(${j.user.id == session.user1.id})--}%

%{--				--}%%{--						<g:if test="${(j.user.id == session.user1.id && j.isRead == false)}">--}%
%{--					<g:if test="${i.deleted == false}">--}%
%{--						<div class="row post-body">--}%
%{--							<div class="col-3" style="padding-left:20px">--}%
%{--								<a href="${createLink(controller: 'Users', action: 'profile')}">--}%
%{--									<g:if test="${i.user.photo}">--}%
%{--										<img src="${createLink(controller: 'dashboard', action: 'fetchImage', params: [id: i.user.id])}"--}%
%{--											 height="100px" width="90px" style="margin-right: 10px;"/>--}%
%{--									</g:if>--}%
%{--									<g:else>--}%
%{--										<asset:image src="${'user.png'}" style="width:90px; height: 100px"/>--}%
%{--									</g:else>--}%
%{--								</a>--}%
%{--							</div>--}%

%{--							<div class="col-9" style="padding-left:0px;">--}%
%{--								<div class="row">${i.description}</div>--}%

%{--								<div class="row">--}%
%{--									<div class="col-4">--}%
%{--										<i class="bi bi-facebook"></i>--}%
%{--										<i class="bi bi-twitter"></i>--}%
%{--										<i class="bi bi-google"></i>--}%
%{--									</div>--}%

%{--									<div class="col-2 ft-s">--}%
%{--									</div>--}%
%{--									<g:if test="${i.filePath != null}">--}%
%{--										<div class="col-2 ft-s"><a--}%
%{--												href="${createLink(controller: 'Resources', action: 'downloadFile', params: [id: i.id])}"--}%
%{--												target="_blank">download</a></div>--}%
%{--									</g:if>--}%
%{--									<g:if test="${i.url != null}">--}%
%{--										<div class="col-2 ft-s"><a--}%
%{--												href="${createLink(absolute: true, uri: "${i.url}")}"--}%
%{--												target="_blank">site</a></div>--}%
%{--									</g:if>--}%
%{--									<g:if test="${linksharing.ReadingItem.findByResourceAndUser(i, u) != null}">--}%
%{--										<div class="col-2 ft-s">Read</div>--}%
%{--									</g:if>--}%
%{--									<g:else>--}%
%{--										<div class="col-2 ft-s"><a--}%
%{--												href="${createLink(controller: 'Resources', action: 'mark', params: [id: i.id])}">mark</a>--}%
%{--										</div>--}%
%{--									</g:else>--}%


%{--									<div class="col-2 ft-s"><a--}%
%{--											href="${createLink(controller: 'Resources', action: 'createResource', params: [id: i.id])}">view post</a>--}%
%{--									</div>--}%
%{--								</div>--}%
%{--							</div>--}%
%{--						</div>--}%
%{--					</g:if>--}%
%{--				</g:each>--}%
				<g:render template="/Templates/posts"></g:render>
			</div>

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


    function visi(e, b) {
        console.log(b.value)
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
        console.log(b.value)
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
            }
        });
    }

    function nextPost() {
        var x = document.getElementById('efg')
        var y = document.getElementById('123')
        console.log(x.value)
		console.log(y.value)
        $.ajax({
            type: 'GET',
            url: '/Topic/nextPageTopic',
            data: {
                page: Number(x.value) + 1,
                params: y.value
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
        var y = document.getElementById('123')
        console.log(x.value)
        $.ajax({
            type: 'GET',
            url: '/Topic/nextPageTopic',
            data: {
                page: Number(x.value) - 1,
                params: y.value
            },
            success: function (data) {
                console.log(data)
                $('#posts').html(data)
// console.log($('.recentShare').html(data))
            }
        });
    }

    function next1() {
        var x = document.getElementById('abc')
        var y = document.getElementById('123').value
        console.log(x.value)
        $.ajax({
            type: 'GET',
            url: '/Dashboard/nextPage',
            data: {
                page: Number(x.value) + 1,
                query: y
            },
            success: function (data) {
                console.log(data)
                $('#posts').html(data)
// console.log($('.recentShare').html(data))
            }
        });
    }
</script>

</body>
</html>