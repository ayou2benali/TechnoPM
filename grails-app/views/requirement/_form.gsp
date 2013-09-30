<%@ page import="com.TechnoPM.Project.Requirement" %>



<div class="fieldcontain ${hasErrors(bean: requirementInstance, field: 'assignee', 'error')} ">
	<label for="assignee">
		<g:message code="requirement.assignee.label" default="Assignee" />
		
	</label>
	<g:select name="assignee" from="${com.TechnoPM.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${requirementInstance?.assignee*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInstance, field: 'author', 'error')} ">
	<label for="author">
		<g:message code="requirement.author.label" default="Author" />
		
	</label>
	<g:select name="author" from="${com.TechnoPM.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${requirementInstance?.author*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="requirement.comments.label" default="Comments" />
		
	</label>
	<g:select name="comments" from="${com.TechnoPM.Project.Comment.list()}" multiple="multiple" optionKey="id" size="5" value="${requirementInstance?.comments*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInstance, field: 'events', 'error')} ">
	<label for="events">
		<g:message code="requirement.events.label" default="Events" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${requirementInstance?.events?}" var="e">
    <li><g:link controller="requirementEvent" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="requirementEvent" action="create" params="['requirement.id': requirementInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'requirementEvent.label', default: 'RequirementEvent')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: requirementInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="requirement.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${requirementInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="requirement.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${com.TechnoPM.Project.Project.list()}" optionKey="id" required="" value="${requirementInstance?.project?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="requirement.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="status" name="status.id" from="${com.TechnoPM.Project.Status.list()}" optionKey="id" required="" value="${requirementInstance?.status?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: requirementInstance, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="requirement.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${requirementInstance?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['requirement.id': requirementInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>

</div>

