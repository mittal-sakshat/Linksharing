<%@ page import="linksharing.Resources; linksharing.Topic" %>

<div class="row recentRow1" style="background-color:#8f8989">
	<h6 style="padding-top:3px;padding-bottom:0px;">Recent Shares</h6>
</div>

<g:if test="${dataRecent.empty}">
	<div>No recent shares available</div>
</g:if>
<g:else>
	<g:each in="${dataRecent}" var="i">


		<g:if test="${i.topic.visibility == Topic.Visibility.Public && i.deleted == false}">
			<div class="row recentRow2" style="padding-bottom:10px;">
				<div class="col-2">
					<a href="${createLink(controller: 'Users', action: 'userProfile')}"><img
							src="${assetPath(src: 'images (2).jpeg')}" alt="photo"></a>
				</div>

				<div class="col-10">
					<div class="row  " style="margin-bottom:-10px;">
						<div class="col-4">
							<p>${i.user.fullName}</p>
						</div>

						<div class="col-4">
							<p>@${i.user.firstName} ${new java.util.Date().minutes - i.lastUpdated.minutes}min ago</p>
						</div>

						<div class="col-4 ">
							${i.topic.name}
						</div>
					</div>

					<div class="row recentshareContent" style="margin-bottom:-10px;">
						<p>${i.description}</p>
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

							%{--										<g:if test="${session.user1 == null}">--}%
							%{--											<div class="popup" id="popup" onclick="myFunction(this)">View Post--}%
							%{--												<span class="popuptext"--}%
							%{--													  id="myPopup+${i.id}">Please login/Register to view the post</span>--}%
							%{--											</div>--}%
							%{--										</g:if>--}%
							%{--										<g:else>--}%
							<a href="${createLink(controller: 'Resources', action: 'index')}?id=${i.id}">View Post</a>
							%{--										</g:else>--}%
						</div>
					</div>
				</div>
			</div>
		</g:if>

	</g:each>
</g:else>
%{--<g:if test="${page <= java.lang.Math.ceil(siz / 2)}">--}%
%{--	<span>--}%
%{--		<g:hiddenField name="hid" id="abc" value="${page}"></g:hiddenField>--}%
%{--		<a href="javascript:void (0)" onclick="nextr()">next</a>--}%
%{--	</span>--}%
%{--</g:if>--}%
<g:if test="${hasPrev}">
	<g:hiddenField name="hid" id="bcd" value="${page}"></g:hiddenField>
	<a href="javascript:void (0)" onclick="previousr()">Previous</a>
</g:if>
<g:if test="${hasNext}">
	<g:hiddenField name="hid" id="abc" value="${page}"></g:hiddenField>
	<a href="javascript:void (0)" onclick="nextr()">Next</a>
</g:if>
