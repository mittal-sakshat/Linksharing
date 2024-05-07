<%@ page import="java.beans.Visibility; linksharing.Resources; linksharing.Topic" %>
<%@ page import="linksharing.Subscription" %>
<%@ page import="linksharing.Topic" %>

<div class="row subscriptions-head">
	<div class="col-6">Trending Topics</div>

	<div class="col-6"><a data-toggle="modal" data-target="#topicModal1">View All</a></div>

	<div class="modal fade" id="topicModal1">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">All Topics</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal Body -->
				<div class="modal-body">
					<g:each in="${linksharing.Topic.createCriteria().list {
						eq('deleted',false)
						order('name','desc')
						eq('visibility',Topic.Visibility.Public)
					}}" var="i">
							<div class="row subscription-body">
								<div class="col-4">
									<a href="${createLink(controller: 'Users', action: 'profile')}">
										<g:if test="${i.user.photo}">
											<img src="${createLink(controller: 'dashboard', action: 'fetchImage', params: [id: i.user.id])}"
												 height="100px" width="90px" style="margin-right: 10px;"/>
										</g:if>
										<g:else>
											<asset:image src="${'images.jpeg'}"
														 style="width:90px; height: 100px"/>
										</g:else></a>
								</div>

								<div class="col-8">
									<div class="name" style="padding:3px;">
										<a href="${createLink(controller: 'Topic', action: 'index')}?params=${i.id}&params2=${query ? query : ""}"
										   id="${i.id}anchor1">${i.name}</a>
									</div>
									<div class="row handle">
										<div class="col-4">@${i.user?.firstName}</div>

										<div class="col-4">Subscriptions</div>

										<div class="col-4">Posts</div>
									</div>

									<div class="row">
										<g:if test="${Subscription.findByTopicAndUser(i, u) == null}">
											<div class="col-4"><a
													href="${createLink(controller: 'Subscription', action: 'subscribe', params: [u: u?.id, t: i.id])}">Subscribe</a>
											</div>
										</g:if>
										<g:else>
											<div class="col-4"><a
													href="${createLink(controller: 'Subscription', action: 'unSubscribe', params: [u: u?.id, t: i.id, flag: 1])}">Unsubscribe</a>
											</div>
										</g:else>
										<div class="col-4">${Subscription.findAllByTopic(i)?.size()}</div>

										<div class="col-4">${Resources.findAllByTopicAndDeleted(i, false).size()}</div>
									</div>
								</div>
							</div>
							<br>
					</g:each>

				</div>

				<!-- Modal Footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>

			</div>
		</div>
	</div>
</div>













<g:each in="${to}" var="i">
%{--                       ${topicSubscription}--}%
	<g:if test="${(i.deleted == false && i.visibility == linksharing.Topic.Visibility.Public) }">
		<div class="card1">
			<div class="row subscription-body">
				<div class="col-4">
					<a href="${createLink(controller: 'Users', action: 'profile')}">
						<g:if test="${i.user.photo}">
							<img src="${createLink(controller: 'dashboard', action: 'fetchImage', params: [id: i.user.id])}"
								 height="100px" width="90px" style="margin-right: 10px;"/>
						</g:if>
						<g:else>
							<asset:image src="${'images.jpeg'}"
										 style="width:90px; height: 100px"/>
						</g:else></a>
				</div>

				<div class="col-8">
					<div class="name" style="padding:3px;">
						<a href="${createLink(controller: 'Topic', action: 'index')}?params=${i.id}&params2=${query ? query : ""}"
						   id="${i.id}anchor1">${i.name.size() > 20 ? i.name.substring(0,20)+"..." : i.name}</a>

						<div id="${i.id}editForm1" style="display: none;">
							<input type="text" id="${i.id}editInput1" value="${i?.name}">
							<button onclick="saveEdit1(this)" id="${i.id}">Save</button>
							<button onclick="cancelEdit1(this)" id="${i.id}">Cancel</button>
						</div>
					</div>

					<div class="row handle">
						<div class="col-4">@${i.user?.firstName.size() > 10 ? i.user?.firstName.substring(0,10) : i.user?.firstName}</div>

						<div class="col-4">Subscriptions</div>

						<div class="col-4">Posts</div>
					</div>

					<div class="row">
						<g:if test="${Subscription.findByTopicAndUser(i, u) == null}">
							<div class="col-4"><a
									href="${createLink(controller: 'Subscription', action: 'subscribe', params: [u: u?.id, t: i.id])}">Subscribe</a>
							</div>
						</g:if>
						<g:else>
							<div class="col-4"><a
									href="${createLink(controller: 'Subscription', action: 'unSubscribe', params: [u: u?.id, t: i.id, flag: 1])}">Unsubscribe</a>
							</div>
						</g:else>
						<div class="col-4">${Subscription.findAllByTopic(i)?.size()}</div>

						<div class="col-4">${Resources.findAllByTopicAndDeleted(i, false).size()}</div>
					</div>
				</div>
			</div>

			<div class="row subscription-foot">
				<div class="col-4 seriousness">
					<g:if test="${u?.id == i?.user?.id || u?.admin == true}">
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
					<g:if test="${u?.id == i?.user?.id || u?.admin == true}">
						<g:select id="visiblityTop${i.id}" from="['Public', 'Private']" name="selectedTopic"
								  data="${i.id}" value="${i.visibility}" onchange="visi(this.id, this)" class="ldinsd">
						</g:select>
					</g:if>
					%{--									<select id="visiblityTop" name="visiblity" data="${i.id}" onchange="rate(this.id,this)" value="${i.visibility}">--}%
					%{--										<option value="Public">Public</option>--}%
					%{--										<option value="Private">Private</option>--}%
					%{--									</select>--}%
				</div>

				<div class="col-4 other-functions">
					<g:if test="${u?.id == i?.user?.id || u?.admin == true}">
						<i class="bi bi-pencil-square"
						   id="${i.id}" onclick="showEdit1(this)"></i>

						<g:javascript>
							function showEdit1(a) {
								// console.log(document.getElementById(a.id + "anchor1"))
								document.getElementById(a.id + "editForm1").style.display = "block";
								console.log(a.id + "editForm1")
								// console.log(document.getElementById(a.id+"editForm"));
								document.getElementById(a.id + "anchor1").style.display = "none";
								console.log(a.id)

								// Populate the input field with the current value (if needed)
								// For example: document.getElementById("editInput").value = currentValue;
							}

							function saveEdit1(e) {
								var selectedElement = document.getElementById(e.id);
								var element = document.getElementById(e.id + "editInput1");
								console.log(element.value)
								// e.preventDefault();
								$.ajax({
									type: 'GET',
									url: '/Subscription/editSubscriptionName',
									data: {
										name: element.value,
										id2: e.id
									},
									success: function (data) {
										console.log(data)
										document.getElementById(e.id + "editForm1").style.display = "none";
										document.getElementById(e.id + "anchor1").style.display = "block";
										// document.getElementById(e.id+"editInput").value = data.name
										document.getElementById(e.id + "anchor1").textContent = data.name

										// your code
									}
								});
							}

							function cancelEdit1(a) {
								// Hide the edit form
								document.getElementById(a.id + "editForm1").style.display = "none";
								document.getElementById(a.id + "anchor1").style.display = "block";
							}

						</g:javascript>



						<i class="bi bi-trash text-dark" data-toggle="modal" data-target="#myModal7" id="${i.id}"></i>

						<div class="modal fade" id="myModal7" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->

								<div class="modal-content">
									<g:form controller="Topic" action="deleteTopic">
										<input type="hidden" name="id3" id="id5" value=""/>

										<div class="modal-header">

											<h4 class="modal-title">Delete Topic</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>

										<div class="modal-body">
											<p>Are you sure to Delete?</p>
										</div>

										<div class="modal-footer">
											<button type="submit" class="btn btn-primary">Yes</button>
											<button type="button" class="btn btn-default"
													data-dismiss="modal">No</button>
										</div>
									</g:form>
								</div>

							</div>
						</div>

					%{--										<a href="${createLink(controller: 'Topic', action: 'deleteTopic', params: [id: i.id, flag: 0])}"></a>--}%
					</g:if>
%{--					<i class="bi bi-envelope"></i>--}%
				</div>
			</div>
		</div>
	</g:if>

</g:each>

<script>

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

    $(document).ready(function () {
        //     // Capture click event of the icon
        //     $(".bi-pencil-square").click(function () {
        //         // Extract the ID of the clicked icon
        //         var iconId = $(this).attr("id");
        //
        //         // Pass the ID value to the modal
        //         console.log(iconId)
        //         console.log(document.getElementById('id4'))
        //
        //         document.getElementById('id4').value = iconId
        //
        //     });
        //
        $(".bi-trash").click(function () {
            // Extract the ID of the clicked icon
            var iconId = $(this).attr("id");
            // Pass the ID value to the modal
            document.getElementById('id5').value = iconId
        });
    });
</script>