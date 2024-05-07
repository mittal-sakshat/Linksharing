<%@ page import="linksharing.Subscription" %>
<%@ page import="linksharing.Topic" %>
<%@ page import="linksharing.ReadingItem" %>
<%@ page import="linksharing.Resources" %>
<%@ page import="linksharing.ResourceRating" %>
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
	<title>Posts</title>
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
    border-radius: 5px;
    margin-top: 10px;
    padding: 10px;
}

.post-head {
    border-bottom: 2px solid black;
    margin: 0px;
    background-color: #8f8989;
}

.post-body {
    margin-top: 10px;
}

.post-desc {
    padding: 10px;
    font-size: 16px;
}

.star, .star1 {
    font-size: 4vh;
    cursor: pointer;

}

.one {
    color: rgb(255, 0, 0);
}

.two {
    color: rgb(255, 106, 0);
}

.three {
    color: rgb(251, 255, 120);
}

.four {
    color: rgb(255, 255, 0);
}

.five {
    color: rgb(24, 159, 14);
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

	<div class="row">

		<div class="col-6 ">
			%{--			<g:each in="${ReadingItem?.list()}" var="i">--}%
			<div class="post">
				<div class="row post-body">
					<div class="col-4">
						<a href="${u != null ? createLink(controller: 'Users', action: 'profile') : '#'}">
							<g:if test="${r.user.photo}">
								<img src="${createLink(controller: 'dashboard', action: 'fetchImage', params: [id: r.user.id])}"
									 height="100px" width="90px" style="margin-right: 10px;"/>
							</g:if>
							<g:else>
								<asset:image src="${'images.jpeg'}" style="width:90px; height: 100px"/>
							</g:else>
						</a>
					</div>

					<div class="col-8">
						<div class="row">
							<div class="col-6">${r.user.fullName.size() > 15 ? r.user.fullName.substring(0,15)+"..." : r.user.fullName}</div>

							<div class="col-6"><a class=" align-item-end"
												  href="${u != null ? createLink(controller: 'Topic', action: 'index') : '#'}?params=${r.topic.id}">${r.topic.name.size() > 15 ? r.topic.name.substring(0,15)+"..." : r.topic.name}</a>
							</div>
						</div>

						<div class="row">
							<div class="col-6" style="color:grey;">@${r.user.firstName.size() > 15 ? r.user.firstName.substring(0,15)+"..." : r.user.firstName}</div>

							<div class="col-6"><a class=" align-item-end" href="#"
												  style="color:grey; text-decoration:none;">${r.dateCreated}</a>
							</div>
						</div>

						<div class="row">
							<div class="col-6" id="rating">

								Average rating :${rating}

							</div>
							<div class="col-6">
								<g:if test="${u != null}">
									<span
											onclick="x(1,${r.id})"
											class="star text-dark">★
									</span>
										<span onclick="x(2,${r.id})"
											  class="star text-dark">★
										</span>

										<span onclick="x(3,${r.id})"
											  class="star text-dark">★
										</span>

										<span onclick="x(4,${r.id})"
											  class="star text-dark">★
										</span>


										<span onclick="x(5,${r.id})"
											  class="star text-dark">★
										</span>







									<script>
                                        // if(u == null)
                                        %{--gfg(${(Integer)java.lang.Math.ceil(rating)})--}%
                                        let stars =
                                            document.getElementsByClassName("star");
                                        console.log(stars)

										function x(n,id){
                                            gfg(n)
											rate(n,id)
										}

                                        // Funtion to update rating
                                        function gfg(n) {
                                            console.log(stars)
                                            console.log(n)
                                            remove();
                                            let cls
                                            // n=n-48
                                            for (let i = 0; i < n; i++) {
                                                if (n == 1) cls = "one";
                                                else if (n == 2) cls = "two";
                                                else if (n == 3) cls = "three";
                                                else if (n == 4) cls = "four";
                                                else if (n == 5) cls = "five";
                                                console.log(stars[i]);
                                                stars[i].className = "star " + cls;
                                            }
                                        }

                                        // To remove the pre-applied styling
                                        function remove() {
                                            let i = 0;
                                            while (i < 5) {
                                                stars[i].className = "star";
                                                i++;
                                            }
                                        }
									</script>
									<g:if test="${u != null && linksharing.ResourceRating.findByUserAndResource(u, r) != null}">
										<script>
                                            console.log(${ResourceRating.findByUserAndResource(u,r)?.score})
                                            gfg(${ResourceRating.findByUserAndResource(u,r)?.score})
										</script>
									</g:if>
								</g:if>

							%{--									<i class="bi bi-heart-fill"></i>--}%
							%{--									<i class="bi bi-heart-fill"></i>--}%
							%{--									<i class="bi bi-heart-fill"></i>--}%
							%{--									<i class="bi bi-heart-fill"></i>--}%
							%{--									<i class="bi bi-heart-fill"></i>--}%
							</div>
						</div>
					</div>
				</div>

				<div class="row post-desc text-center">
					${r.description.size() > 50 ? r.description.substring(0,50)+"..." : r.description}
				</div>

				<div class="row p-2">
					<div class="col-4">
						<i class="bi bi-facebook p-2"></i>
						<i class="bi bi-twitter p-2"></i>
						<i class="bi bi-google p-2"></i>
					</div>
					<g:if test="${session.user1 != null && session.user1.id == r.user.id}">
						<div class="col-2 ft-s"><a
								href="${createLink(controller: 'Resources', action: 'deletePost', params: [id: r.id])}">Delete</a>
						</div>

						<div class="col-1 ft-s" data-toggle="modal" data-target="#myModal5">Edit</div>
					%{--							<a href="${createLink(controller: 'Resources', action: 'editPost', params:[id: r.resource.id])}"></a>--}%

						<div class="modal fade" id="myModal5" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<g:form controller="Resources" action="editPost"
											params="${[id: r.id]}">
										<div class="modal-header">

											<h4 class="modal-title">Edit Post</h4>
											<button type="button" class="close"
													data-dismiss="modal">&times;</button>
										</div>

										<div class="modal-body">
											%{--												<div class="p-4">--}%
											%{--													<label for="name"><b style="color:black;">Edit url:</b></label>--}%
											%{--													<input type="text" value="${r.resource.url}" name="url"--}%
											%{--														   required>--}%

											%{--												</div>--}%
											%{--												<div class="p-4">--}%
											%{--													<label for="name"><b style="color:black;">Edit Description:</b></label>--}%
											%{--													<textarea type="text" placeholder="" name="description"--}%
											%{--															  required>${r.resource.description}</textarea>--}%
											%{--												</div>--}%
											<label for="linkInput" class="form-label">Edit Link:</label>
											<input type="text" class="form-control pb-4" id="linkInput" name="url"
												   value="${r.url}">
											<label for="descriptionTextarea"
												   class="form-label">Edit Description:</label>
											<textarea class="form-control" id="descriptionTextarea" rows="3"
													  name="description">${r.description.size() > 50 ? r.description.substring(0,50)+"..." : r.description}</textarea>

										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
											<button type="submit"
													class="btn btn-primary">Save changes</button>
										</div>
									</g:form>
								</div>
							</div>
						</div>
					</g:if>

					<g:if test="${r.url == null}">
						<div class="col-2 ft-s"><a href="${createLink(controller: 'Resources', action: 'downloadFile', params: [id:r.id])}" target="_blank">Download</a></div>
					</g:if>
					<g:else>
						<div class="col-3 ft-s"><a href="#" onclick="openLink('${r.url}'); return false;">View full site</a></div>
					</g:else>
				</div>

			</div>
			%{--			</g:each>--}%

		</div>

		<div class="col-1"></div>

		<div class="col-5">
			<div class="subscription">
				<g:render template="/Templates/trendingTopics"></g:render>
			</div>
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


    function rate(n,id) {

        // var x = document.getElementById('abc')
        // var y = document.getElementById('123').value
		console.log(n)
        console.log(id)
		console.log(document.getElementById("rating"))
        $.ajax({
            type: 'GET',
            url: '/ResourceRating/rating',
            data: {
                n: n,
				id: id
            },
            success: function (data) {
			console.log(data + "jornebuhroi")
			document.getElementById("rating").textContent = "Average rating : "+ data
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