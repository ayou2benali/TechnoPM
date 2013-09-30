<%@ page import="com.TechnoPM.Project.Project" %>



<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="project.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="status" name="status.id" from="${com.TechnoPM.Project.Status.list()}" optionKey="id" required="" value="${projectInstance?.status?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="project.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${projectInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="project.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${projectInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'members', 'error')} ">
	<label for="members">
		<g:message code="project.members.label" default="Members" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectInstance?.members?}" var="m">
    <li><g:link controller="projectRole" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="projectRole" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'projectRole.label', default: 'ProjectRole')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="project.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${projectInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'requirements', 'error')} ">
	<label for="requirements">
		<g:message code="project.requirements.label" default="Requirements" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectInstance?.requirements?}" var="r">
    <li><g:link controller="requirement" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="requirement" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'requirement.label', default: 'Requirement')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'tasks', 'error')} ">
	<label for="tasks">
		<g:message code="project.tasks.label" default="Tasks" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectInstance?.tasks?}" var="t">
    <li><g:link controller="task" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="task" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'task.label', default: 'Task')])}</g:link>
</li>
</ul>

</div>

