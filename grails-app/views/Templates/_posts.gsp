<%@ page import="linksharing.Resources" %>

<div class="row post-head">
	<div class="col-6">
		%{--		Posts: "${t.name}"--}%
		Posts
	</div>

	<div class="col-4 justify-content-centre">
		<form class="d-flex justify-content-centre">
			<input class="form-control me-2 w-50" type="search" placeholder="Search" aria-label="Search" name="query" id="postVal">
			<button class="btn btn-primary" type="submit" onclick="search()">Search</button>
		</form>
	</div>
</div>
<g:each in="${posts}" var="i">
%{--					println(${i.readingItems})--}%
%{--					${}--}%
%{--					<g:each in="${i.readingItems}" var="j">--}%
%{--						println(${j.isRead})--}%
%{--						println(${j.user.id == session.user1.id})--}%

%{--						<g:if test="${(j.user.id == session.user1.id && j.isRead == false)}">--}%
	<g:if test="${i.deleted == false}">
		<div class="row post-body">
			<div class="col-3" style="padding-left:20px">
				<a href="${createLink(controller: 'Users', action: 'profile')}">
					<g:if test="${i.user.photo}">
						<img src="${createLink(controller: 'dashboard', action: 'fetchImage', params: [id: i.user.id])}"
							 height="100px" width="90px" style="margin-right: 10px;"/>
					</g:if>
					<g:else>
						<asset:image src="${'images.jpeg'}" style="width:90px; height: 100px"/>
					</g:else>
				</a>
			</div>

			<div class="col-9" style="padding-left:0px;">
				<div class="row">${i.description.size() > 50 ? i.description.substring(0,50)+"..." : i.description}</div>

				<div class="row">
					<div class="col-4">
						<i class="bi bi-facebook"></i>
						<i class="bi bi-twitter"></i>
						<i class="bi bi-google"></i>
					</div>

					<div class="col-2 ft-s">
					</div>
					<g:if test="${i.filePath != null}">
						<div class="col-2 ft-s"><a
								href="${createLink(controller: 'Resources', action: 'downloadFile', params: [id: i.id])}"
								target="_blank">download</a></div>
					</g:if>
					<g:if test="${i.url != null}">
						<div class="col-2 ft-s"><a
								href="${createLink(absolute: true, uri: "${i.url}")}"
								target="_blank">site</a></div>
					</g:if>
					<g:if test="${linksharing.ReadingItem.findByResourceAndUser(i, u) != null}">
						<div class="col-2 ft-s">Read</div>
					</g:if>
					<g:else>
						<div class="col-2 ft-s"><a
								href="${createLink(controller: 'Resources', action: 'mark', params: [id: i.id,topicId: i.topic.id])}">mark</a>
						</div>
					</g:else>


					<div class="col-2 ft-s"><a
							href="${createLink(controller: 'Resources', action: 'createResource', params: [id: i.id])}">view post</a>
					</div>
				</div>
			</div>
		</div>
	</g:if>
</g:each>
<g:if test="${hasPrev}">
	<g:hiddenField name="hid" id="ijk" value="${page}"></g:hiddenField>
	<g:hiddenField name="hid" id="lnm" value="${query}"></g:hiddenField>
	<a href="javascript:void (0)" onclick="previousPost()">Previous</a>
</g:if>
<g:if test="${hasNext}">
	<g:hiddenField name="hid" id="efg" value="${page}"></g:hiddenField>
	<g:hiddenField name="hid" id="fgh" value="${query}"></g:hiddenField>
	<a href="javascript:void (0)" onclick="nextPost()">Next</a>
</g:if>
%{--                <g:each in="${linksharing.Resources.findAllByTopic(t)}" var="i">--}%
%{--                    <div class="row post-body">--}%
%{--                        <div class="col-4">--}%
%{--                            <img class="img-fluid" src="${assetPath(src:'unnamed.jpg')}" alt="photo">--}%
%{--                        </div>--}%
%{--                        <div class="col-8">--}%
%{--                            <div class="row">${i.description}</div>--}%
%{--                            <div class="row">--}%
%{--                                <div class="col-4">--}%
%{--                                    <i class="bi bi-facebook"></i>--}%
%{--                                    <i class="bi bi-twitter"></i>--}%
%{--                                    <i class="bi bi-google"></i>--}%
%{--                                </div>--}%
%{--                                <g:if test="${i.filePath != null}">--}%
%{--                                    <div class="col-2 ft-s"><a href="#">Download</a></div>--}%
%{--                                </g:if>--}%
%{--                                <g:else>--}%
%{--                                    <div class="col-2 ft-s"><a href="${createLink(absolute: true, uri: "${i.url}")}" target="_blank">view full site</a></div>    --}%
%{--                                </g:else>--}%
%{--                                --}%
%{--                                <div class="col-2 ft-s"><a href="#">mark as read</a></div>--}%
%{--                                <div class="col-2 ft-s"><a href="#">view post</a></div>--}%
%{--                            </div>--}%
%{--                        </div>--}%
%{--                    </div>--}%
%{--                </g:each>--}%