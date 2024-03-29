
<%@ page import="com.TechnoPM.Project.File" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'file.label', default: 'File')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-file" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-file" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<th><g:message code="file.author.label" default="Author" /></th>
					
						<g:sortableColumn property="description" title="${message(code: 'file.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="enalbed" title="${message(code: 'file.enalbed.label', default: 'Enalbed')}" />
					
						<g:sortableColumn property="filename" title="${message(code: 'file.filename.label', default: 'Filename')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${fileInstanceList}" status="i" var="fileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${fileInstance.id}">${fieldValue(bean: fileInstance, field: "author")}</g:link></td>
					
						<td>${fieldValue(bean: fileInstance, field: "description")}</td>
					
						<td><g:formatBoolean boolean="${fileInstance.enalbed}" /></td>
					
						<td>${fieldValue(bean: fileInstance, field: "filename")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${fileInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
