<div class="col-4">
	<a href="${createLink(controller: 'Users', action: 'profile')}?params=${i}&params2=${j}">
		<g:if test="${u.photo}">
			<img src="${createLink(controller: 'dashboard', action: 'fetchImage', params: [id: u.id])}"
				 height="100px" width="90px" style="margin-right: 10px;"/>
		</g:if>
		<g:else>
			<asset:image src="${'images.jpeg'}"
						 style="width:90px; height: 100px"/>
		</g:else></a>
</div>

<div class="col-8">
	<a href="${createLink(controller: 'Users', action: 'profile')}?params=${i}&params2=${j}"><div
			class="row name"><h4>${u.fullName.size()>20 ? u.fullName.substring(0,20)+"..." : u.fullName}</h4></div></a>

	<a href="${createLink(controller: 'Users', action: 'profile')}?params=${i}&params2=${j}"><div
			class="row handle">@$${u.firstName.size()>20 ? u.firstName.substring(0,20)+"..." : u.firstName}</div></a>

	<div class="row">
		<div class="col-6">Subscriptions</div>

		<div class="col-6">Topics</div>
	</div>

	<div class="row">
		<div class="col-6"><a
				href="${createLink(controller: 'Users', action: 'profile')}?params=${i}&params2=${j}">${i}</a>
		</div>

		<div class="col-6"><a
				href="${createLink(controller: 'Users', action: 'profile')}?params=${i}&params2=${j}">${j}</a>
		</div>
	</div>
</div>