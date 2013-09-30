
<%@ page import="com.TechnoPM.Project.Requirement" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'requirement.label', default: 'Requirement')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-requirement" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-requirement" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list requirement">
			
				<g:if test="${requirementInstance?.assignee}">
				<li class="fieldcontain">
					<span id="assignee-label" class="property-label"><g:message code="requirement.assignee.label" default="Assignee" /></span>
					
						<g:each in="${requirementInstance.assignee}" var="a">
						<span class="property-value" aria-labelledby="assignee-label"><g:link controller="person" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInstance?.author}">
				<li class="fieldcontain">
					<span id="author-label" class="property-label"><g:message code="requirement.author.label" default="Author" /></span>
					
						<g:each in="${requirementInstance.author}" var="a">
						<span class="property-value" aria-labelledby="author-label"><g:link controller="person" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="requirement.comments.label" default="Comments" /></span>
					
						<g:each in="${requirementInstance.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="comment" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInstance?.events}">
				<li class="fieldcontain">
					<span id="events-label" class="property-label"><g:message code="requirement.events.label" default="Events" /></span>
					
						<g:each in="${requirementInstance.events}" var="e">
						<span class="property-value" aria-labelledby="events-label"><g:link controller="requirementEvent" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="requirement.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${requirementInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInstance?.project}">
				<li class="fieldcontain">
					<span id="project-label" class="property-label"><g:message code="requirement.project.label" default="Project" /></span>
					
						<span class="property-value" aria-labelledby="project-label"><g:link controller="project" action="show" id="${requirementInstance?.project?.id}">${requirementInstance?.project?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="requirement.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:link controller="status" action="show" id="${requirementInstance?.status?.id}">${requirementInstance?.status?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${requirementInstance?.tasks}">
				<li class="fieldcontain">
					<span id="tasks-label" class="property-label"><g:message code="requirement.tasks.label" default="Tasks" /></span>
					
						<g:each in="${requirementInstance.tasks}" var="t">
						<span class="property-value" aria-labelledby="tasks-label"><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${requirementInstance?.id}" />
					<g:link class="edit" action="edit" id="${requirementInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
