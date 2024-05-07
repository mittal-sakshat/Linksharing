<div class="row search-row">
	<div class="col-4 justify-content-start align-items-center">
		<a href="${createLink(controller: 'Dashboard', action: 'index')}" class="navbar-link"><h2>Link Sharing</h2>
		</a>
	</div>

	<div class="col-4 justify-content-centre">

	%{--			<form class="d-flex justify-content-centre">--}%
	%{--				<input class="form-control me-2 w-50" type="search" placeholder="Search" aria-label="Search">--}%
	%{--				<button class="btn btn-outline-primary" type="submit">Search</button>--}%
	%{--			</form>--}%

		<g:form controller="Search" action="search" method="get" class="d-flex justify-content-centre">
			<input class="form-control me-2 w-50" type="search" placeholder="Search" aria-label="Search"
				   name="query">
			<button class="btn btn-primary" type="submit">Search</button>
		</g:form>
	</div>

	<div class="col-4 other-functions">

		<i class="bi bi-chat-fill nav-search" data-toggle="modal" data-target="#myModal1"></i>
		<!-- Modal -->
		<div class="modal fade" id="myModal1" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->

				<div class="modal-content">
					<g:form controller="Topic" action="saveTopic" params="${[id: u.id]}">
						<div class="modal-header">

							<h4 class="modal-title">Create Topic</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<div class="modal-body">
							<div class="row pb-2">
								<label for="name" class="pl-2"><b style="color:black;">Name:</b></label>

								<div class="col-4"></div>

								<input type="text" placeholder="Enter Name" name="name" required maxlength="50">
							</div>

							<div class="row">
								<label for="name" class="pl-2"><b style="color:black;">Visibility:</b></label>

								<div class="col-4"></div>
								<select id="tabs" name="visibility">
									<option value="Public">Public</option>
									<option value="Private">Private</option>
								</select>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Save changes</button>
						</div>
					</g:form>
				</div>

			</div>
		</div>



		<i class="bi bi-envelope nav-search" data-toggle="modal" data-target="#myModal2"></i>

		<div class="modal fade" id="myModal2" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<g:form controller="Mail" action="SendMail">
						<div class="modal-header">

							<h4 class="modal-title">Send Email</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<div class="modal-body">

							<label for="email"><b style="color:black;">Email:</b></label>
							<input type="email" placeholder="Enter Name" name="email" required maxlength="50">
							<br>
							<label for="name"><b style="color:black;">Topic:</b></label>
							<g:select
									name="selectedTopicId"
									from="${linksharing.Subscription.createCriteria().list {
										def topicAlias = 'topicAlias'
										createAlias('topic', topicAlias)

										and {
											eq('user', session.user1)
											eq("${topicAlias}.deleted", false)
										}
										projections {
											property('topic')
										}
									}}"
									optionKey="id"
									optionValue="${{ it.name + ' - ' + it.user.firstName }}"
									value="${selectedTopicId}"/>

						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Send Invite</button>
						</div>
					</g:form>
				</div>
			</div>
		</div>



		<i class="bi bi-link-45deg" data-toggle="modal" data-target="#myModal3"></i>

		<!-- Modal -->
		<div class="modal fade" id="myModal3" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<g:form controller="Resources" action="saveResource" params="${[id: u.id, flag: 1]}">
						<div class="modal-header">

							<h4 class="modal-title">Create Link Resource</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<div class="modal-body">

							<label for="linkInput" class="form-label">Link</label>
							<input type="text" class="form-control" id="linkInput" name="url" maxlength="100">
							<label for="descriptionTextarea" class="form-label">Description</label>
							<textarea class="form-control" id="descriptionTextarea" rows="3"
									  name="description" maxlength="100"></textarea>
							<label for="topicInput" class="form-label">Topic</label>
							%{--								<g:select from="${linksharing.Subscription.findAllByUser(session.user1).topic.name + linksharing.Subscription.findAllByUser(session.user1).topic.user.firstName}" name="topic"  optionKey="${id}" optionValue="${name}" value="${id}"></g:select>--}%
							<g:select name="selectedTopicId"
									  from="${linksharing.Subscription.createCriteria().list {
										  def topicAlias = 'topicAlias'
										  createAlias('topic', topicAlias)

										  and {
											  eq('user', session.user1)
											  eq("${topicAlias}.deleted", false)
										  }
										  projections {
											  property('topic')
										  }
									  }}"
									  optionKey="id"
									  optionValue="${{ it.name + ' - ' + it.user.firstName }}"
									  value="${selectedTopicId}"/>

						</div>

						<div class="modal-footer">
							<button type="submit" class="btn btn-primary me-md-2">Share</button>
							<button type="button" class="btn btn-secondary">Cancel</button>
						</div>
					</g:form>
				</div>

			</div>
		</div>

		<i class="bi bi-pencil-square nav-search" data-toggle="modal" data-target="#myModal4"></i>
		<!-- Modal -->
		<div class="modal fade" id="myModal4" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<g:form controller="Resources" action="saveDocResource" params="${[id: u.id, flag: 1]}"
							enctype="multipart/form-data">
						<div class="modal-header">

							<h4 class="modal-title">Create Document Resource</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>

						<div class="modal-body">

							<label for="reg" class="form-label me-3">Add Attachement:</label>
							<input type="file" oninput="validateFile()" id="fileInput" accept="image/*,.pdf,.doc,.docx,.txt" name="filePath"
								   size="35">
							<span id="filePath-error" class="error-message"></span>
							<label for="descriptionTextarea" class="form-label">Description</label>
							<textarea class="form-control" id="descriptionTextarea" rows="3"
									  name="description" maxlength="256"></textarea>
							<label for="topicInput" class="form-label">Topic</label>
							<g:select name="selectedTopicId"
									  from="${linksharing.Subscription.createCriteria().list {
										  def topicAlias = 'topicAlias'
										  createAlias('topic', topicAlias)
										  and {
											  eq('user', session.user1)
											  eq("${topicAlias}.deleted", false)
										  }
										  projections {
											  property('topic')
										  }
									  }}"
									  optionKey="id"
									  optionValue="${{ it.name + ' - ' + it.user.firstName }}"
									  value="${selectedTopicId}"/>
						</div>

						<div class="modal-footer">
							<button type="submit" class="btn btn-primary me-md-2">Share</button>
							<button type="button" class="btn btn-secondary">Cancel</button>
						</div>
					</g:form>
				</div>

			</div>
		</div>

		<span>${u.firstName.size()>15 ? u.firstName.substring(0,15)+"..." : u.firstName}</span>
		<span class="dropdown">

			<i class="bi bi-caret-down-fill" id="dropdownMenuButton" data-toggle="dropdown"></i>

			<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
				<a class="dropdown-item"
				   href="${createLink(controller: 'Users', action: 'index')}?params=${u.id}">Profile</a>
				<g:if test="${u.admin == true}">
					<a class="dropdown-item"
					   href="${createLink(controller: 'Admin', action: 'index')}?params=${u.id}">Users</a>


				%{--						<a class="dropdown-item" data-toggle="modal" data-target="#myModal">Topics</a>--}%

				%{--						<a class="dropdown-item" data-toggle="modal" data-target="#myModalPosts">Posts</a>--}%

				</g:if>
				<a class="dropdown-item" href="${createLink(controller: 'Login', action: 'logout')}">Logout</a>
			</div>

		</span>

	</div>

</div>
