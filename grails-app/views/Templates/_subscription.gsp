<%@ page import="linksharing.Subscription" %>
<%@ page import="linksharing.Resources" %>

<div class="row subscriptions-head">
	<div class="col-6">Subscriptions</div>
</div>

<g:each in="${paginatedList}" var="i">
	<g:if test="${i?.user?.id == u.id && i.topic.deleted == false}">
		<div class="card1">
			<div class="row subscription-body">
				<div class="col-4">
					<a href="${createLink(controller: 'Users', action: 'profile')}">
						<g:if test="${i.topic.user.photo}">
							<img src="${createLink(controller: 'dashboard', action: 'fetchImage', params: [id: i.topic.user.id])}"
								 height="100px" width="90px" style="margin-right: 10px;"/>
						</g:if>
						<g:else>
							<asset:image src="${'images.jpeg'}"
										 style="width:90px; height: 100px"/>
						</g:else>
					</a>
				</div>

				<div class="col-8">
					<div class="name" style="padding:3px;">
						<g:hiddenField name="xyz" value="${i.topic.id}"></g:hiddenField>
						<a href="${createLink(controller: 'Topic', action: 'index')}?params=${i.topic.id}" id="${i.topic.id}anchor">${i?.topic.name.size() > 20 ? i?.topic.name.substring(0,20) +"..." : i?.topic.name }</a>
%{--						println(${i.topic.id}editForm)--}%
						<div id="${i.topic.id}editForm" style="display: none;">
							<input type="text" id="${i.topic.id}editInput" value="${i?.topic.name}">
							<button onclick="saveEdit(this)" id="${i.topic.id}">Save</button>
							<button onclick="cancelEdit(this)" id="${i.topic.id}">Cancel</button>
						</div>
					</div>

					<div class="row handle">
						<div class="col-4">@${i?.topic?.user?.firstName.size() > 10 ? i?.topic?.user?.firstName.substring(0,10)+"..." : i?.topic?.user?.firstName}</div>

						<div class="col-4">Subscriptions</div>

						<div class="col-4">Posts</div>
					</div>

					<div class="row">
						<div class="col-4"><a
								href="${createLink(controller: 'Subscription', action: 'unSubscribe', params: [t: i.id, flag: 0])}">Unsubscribe</a>
						</div>

						<div class="col-4">${Subscription.findAllByTopic(i.topic)?.size()}</div>

						<div class="col-4">${Resources.findAllByTopicAndDeleted(i.topic, false).size()}</div>
					</div>
				</div>
			</div>

			<div class="row subscription-foot">
				<div class="col-4 seriousness">
					<g:if test="${u.id == i?.topic.user?.id || u.admin == true}">
						<g:select id="seriousSub${i.id}" from="['Serious', 'Casual', 'Very_Serious']"
								  name="selectedTopic"
								  data="${i.topic.id}"
								  value="${i.seriousness}"
								  onchange="serious(this.id, this)">
						</g:select>
					</g:if>
				</div>

				<div class="col-3 visible">
					<g:if test="${u.id == i?.topic.user?.id || u.admin == true}">
						<g:select id="visiblitySub${i.id}" from="['Public', 'Private']" name="selectedTopic"
								  data="${i.topic.id}" value="${i.topic.visibility}"
								  onchange="visi(this.id, this)">
						</g:select>
					</g:if>
				</div>

				<div class="col-4 other-functions">
					<g:if test="${u?.id == i?.topic.user?.id || u.admin == true}">

							<i class="bi bi-pencil-square"
							   id="${i.topic.id}" onclick="showEdit(this)"></i>

						<g:javascript>
							function showEdit(a)
							{
                                console.log(a.id)
								document.getElementById(a.id+"editForm").style.display = "block";
                                console.log(a.id+"editForm")
                                // console.log(document.getElementById(a.id+"editForm"));
								document.getElementById(a.id+"anchor").style.display = "none";
                                console.log(a.id)

								// Populate the input field with the current value (if needed)
								// For example: document.getElementById("editInput").value = currentValue;
							}

							function saveEdit(e) {
								var selectedElement = document.getElementById(e.id);
								var element = document.getElementById(e.id+"editInput");
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
										document.getElementById(e.id+"editForm").style.display = "none";
										document.getElementById(e.id+"anchor").style.display = "block";
                                        // document.getElementById(e.id+"editInput").value = data.name
										document.getElementById(e.id+"anchor").textContent = data.name
										flash.message = "Subscribed Topic name edited Successfully!"
										// your code
									}
								});
							}

							function cancelEdit(a) {
								// Hide the edit form
								document.getElementById(a.id+"editForm").style.display = "none";
								document.getElementById(a.id+"anchor").style.display = "block";
							}

						</g:javascript>

						<div class="modal fade" id="myModal5" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->
								<div class="modal-content">
									<g:form controller="Subscription" action="editSubscriptionName">
										<input type="hidden" name="id2" id="id2"/>

										<div class="modal-header">
											<h4 class="modal-title">Edit Topic</h4>
											<button type="button" class="close"
													data-dismiss="modal">&times;</button>
										</div>

										<div class="modal-body">

											<label for="name"><b style="color:black;">Edit name:</b>
											</label>
											<input type="text" placeholder="Enter Name" name="name"
												   required>
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

					%{--										<a href="${createLink(controller: 'Topic', action: 'deleteTopic', params: [id: i.id, flag: 1])}"><i--}%
					%{--												class="bi bi-trash text-dark"></i></a>--}%

						<i class="bi bi-trash text-dark" data-toggle="modal" data-target="#myModal6"
						   id="${i.topic.id}"></i>

						<div class="modal fade" id="myModal6" role="dialog">
							<div class="modal-dialog">

								<!-- Modal content-->

								<div class="modal-content">
									<g:form controller="Topic" action="deleteTopic">
										<input type="hidden" name="id3" id="id3" value=""/>

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
					</g:if>
%{--					<i class="bi bi-envelope"></i>--}%
				</div>
			</div>
		</div>
	</g:if>
</g:each>

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
                var1: selectedElement.value,
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
                var1: selectedElement.value,
                tId: b.getAttribute("data")
            },
            success: function (data) {
                console.log(data);

                // your code
            }
        });
    }


    $(document).ready(function () {
        // Capture click event of the icon
        $(".bi-pencil-square").click(function () {
            // Extract the ID of the clicked icon
            var iconId = $(this).attr("id");

            // Pass the ID value to the modal
            console.log(iconId)
            console.log(document.getElementById('id2'))

            document.getElementById('id2').value = iconId

        });

        $(".bi-trash").click(function () {
            // Extract the ID of the clicked icon
            var iconId = $(this).attr("id");

            // Pass the ID value to the modal
            console.log(iconId)
            console.log(this)
			if(document.getElementById('id3') != null){
                console.log(document.getElementById('id3'))
                console.log(document.getElementById('id3').value)
                document.getElementById('id3').value = iconId
                console.log(document.getElementById('id3').value)
			}

        });
    });
</script>
