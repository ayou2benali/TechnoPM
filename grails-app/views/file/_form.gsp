<%@ page import="com.TechnoPM.Project.File" %>



<div class="fieldcontain ${hasErrors(bean: fileInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="file.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${com.TechnoPM.Person.list()}" optionKey="id" required="" value="${fileInstance?.author?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fileInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="file.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${fileInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: fileInstance, field: 'enalbed', 'error')} ">
	<label for="enalbed">
		<g:message code="file.enalbed.label" default="Enalbed" />
		
	</label>
	<g:checkBox name="enalbed" value="${fileInstance?.enalbed}" />
</div>

<div class="fieldcontain ${hasErrors(bean: fileInstance, field: 'filename', 'error')} ">
	<label for="filename">
		<g:message code="file.filename.label" default="Filename" />
		
	</label>
	<g:textField name="filename" value="${fileInstance?.filename}"/>
</div>

