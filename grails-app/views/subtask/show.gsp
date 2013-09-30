
<%@ page import="com.TechnoPM.Project.Subtask" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subtask.label', default: 'Subtask')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-subtask" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-subtask" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list subtask">
			
				<g:if test="${subtaskInstance?.complete}">
				<li class="fieldcontain">
					<span id="complete-label" class="property-label"><g:message code="subtask.complete.label" default="Complete" /></span>
					
						<span class="property-value" aria-labelledby="complete-label"><g:formatBoolean boolean="${subtaskInstance?.complete}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${subtaskInstance?.creationDate}">
				<li class="fieldcontain">
					<span id="creationDate-label" class="property-label"><g:message code="subtask.creationDate.label" default="Creation Date" /></span>
					
						<span class="property-value" aria-labelledby="creationDate-label"><g:formatDate date="${subtaskInstance?.creationDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${subtaskInstance?.creator}">
				<li class="fieldcontain">
					<span id="creator-label" class="property-label"><g:message code="subtask.creator.label" default="Creator" /></span>
					
						<span class="property-value" aria-labelledby="creator-label"><g:link controller="person" action="show" id="${subtaskInstance?.creator?.id}">${subtaskInstance?.creator?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${subtaskInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="subtask.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${subtaskInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subtaskInstance?.order}">
				<li class="fieldcontain">
					<span id="order-label" class="property-label"><g:message code="subtask.order.label" default="Order" /></span>
					
						<span class="property-value" aria-labelledby="order-label"><g:fieldValue bean="${subtaskInstance}" field="order"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${subtaskInstance?.task}">
				<li class="fieldcontain">
					<span id="task-label" class="property-label"><g:message code="subtask.task.label" default="Task" /></span>
					
						<span class="property-value" aria-labelledby="task-label"><g:link controller="task" action="show" id="${subtaskInstance?.task?.id}">${subtaskInstance?.task?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${subtaskInstance?.id}" />
					<g:link class="edit" action="edit" id="${subtaskInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
