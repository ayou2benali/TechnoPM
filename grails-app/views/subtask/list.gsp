
<%@ page import="com.TechnoPM.Project.Subtask" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'subtask.label', default: 'Subtask')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-subtask" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-subtask" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="complete" title="${message(code: 'subtask.complete.label', default: 'Complete')}" />
					
						<g:sortableColumn property="creationDate" title="${message(code: 'subtask.creationDate.label', default: 'Creation Date')}" />
					
						<th><g:message code="subtask.creator.label" default="Creator" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'subtask.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="order" title="${message(code: 'subtask.order.label', default: 'Order')}" />
					
						<th><g:message code="subtask.task.label" default="Task" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${subtaskInstanceList}" status="i" var="subtaskInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${subtaskInstance.id}">${fieldValue(bean: subtaskInstance, field: "complete")}</g:link></td>
					
						<td><g:formatDate date="${subtaskInstance.creationDate}" /></td>
					
						<td>${fieldValue(bean: subtaskInstance, field: "creator")}</td>
					
						<td>${fieldValue(bean: subtaskInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: subtaskInstance, field: "order")}</td>
					
						<td>${fieldValue(bean: subtaskInstance, field: "task")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${subtaskInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
