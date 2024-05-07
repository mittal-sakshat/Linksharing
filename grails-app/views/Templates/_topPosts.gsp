<div class="row postRow1" style="background-color:#8f8989;">
	<div class="col-4">
		<h6 style="padding-top:3px;padding-bottom:0px;">Top Posts</h6>
	</div>

	<div class="col-4">
	</div>


</div>
<g:if test="${dataRecent.empty}">
	<div>No top posts available</div>
</g:if>
<g:each in="${dataForPage}" var="i">
	<g:if test="${i.topic.visibility == linksharing.Topic.Visibility.Public && i.deleted == false}">
		<div class="row postRow2" style="padding-bottom:10px;">
			<div class="col-2">
				<img src="${assetPath(src: 'images (2).jpeg')}" alt="photo">
			</div>

			<div class="col-10">
				<div class="row  " style="margin-bottom:-10px;margin-left: 5px;">
					<div class="col-4">
						<p>${i.user.fullName}</p>
					</div>

					<div class="col-4">
						<p>@${i.user.username} ${new Date().minutes - i.lastUpdated.minutes} min</p>
					</div>

					<div class="col-4 ">
						${i.topic.name}
					</div>
				</div>

				<div class="row postContent" style="margin-bottom:-10px;margin-left: 5px">
					<p>${i.description}</p>
				</div>

				<div class="row">
					<div class="col-4 socialMedia" >
						<a href="www.facebook.com"><i class="fa-brands fa-facebook-f"></i></a>
						<a href="www.facebook.com"><i class="fa-brands fa-twitter"></i></a>
						<a href="www.facebook.com"><i class="fa-brands fa-google"></i></a>
					</div>

					<div class="col-4">

					</div>

					<div class="col-4">
						<a href="${createLink(controller: 'Resources', action: 'index')}?id=${i.id}">View Post</a>
					</div>
				</div>
			</div>

		</div>
	</g:if>
</g:each>
<g:if test="${hasPrev}">
	<g:hiddenField name="hid" id="cde" value="${page}"></g:hiddenField>
	<a href="javascript:void (0)" onclick="previousp()">Previous</a>
</g:if>
<g:if test="${hasNext}">
	<g:hiddenField name="hid" id="def" value="${page}"></g:hiddenField>
	<a href="javascript:void (0)" onclick="nextp()">Next</a>
</g:if>