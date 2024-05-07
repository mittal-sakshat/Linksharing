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
    border-radius: 5px;
    margin-top: 10px;
    overflow: hidden;
}

.post-head {
    border-bottom: 2px solid black;
    margin: 0px;
    background-color: #8f8989;
}

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
    border-bottom: none;
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


.popup {
    position: relative;
    display: inline-block;
    cursor: pointer;
}
</style>

<div class="container">
	<g:render template="/Templates/navbar"></g:render>
	<br>

	<div class="row">
		<div class="col-6">
			<div id="subscription1">
				<g:render template="/Templates/trendingTopics"></g:render>
			</div>

			<br>
			<br>

			<div class="row postRow" id="topPost">
				<g:render template="/Templates/topPosts"></g:render>
			</div>
		</div>
		%{--		<div class="col-1"> </div>--}%
		<div class="col-6">
			<div class="row post" id="posts">
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

    function next1() {
        var x = document.getElementById('abc')
		var y = document.getElementById('123').value
        console.log(x.value)
        $.ajax({
            type: 'GET',
            url: '/Search/nextPage',
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

    function search() {
        var x = document.getElementById('postVal')
        console.log(x.value)
        $.ajax({
            type: 'GET',
            url: '/Search/searchPost',
            data: {

                query: x.value
            },
            success: function (data) {
                console.log(data)
                $('#posts').html(data)
// console.log($('.recentShare').html(data))
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
</script>

</body>
</html>