<%@ page import="com.TechnoPM.Project.Task" %>



<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'assignee', 'error')} required">
	<label for="assignee">
		<g:message code="task.assignee.label" default="Assignee" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="assignee" name="assignee.id" from="${com.TechnoPM.Person.list()}" optionKey="id" required="" value="${taskInstance?.assignee?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'author', 'error')} required">
	<label for="author">
		<g:message code="task.author.label" default="Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="author" name="author.id" from="${com.TechnoPM.Person.list()}" optionKey="id" required="" value="${taskInstance?.author?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="task.comments.label" default="Comments" />
		
	</label>
	<g:select name="comments" from="${com.TechnoPM.Project.Comment.list()}" multiple="multiple" optionKey="id" size="5" value="${taskInstance?.comments*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'createdDate', 'error')} required">
	<label for="createdDate">
		<g:message code="task.createdDate.label" default="Created Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdDate" precision="day"  value="${taskInstance?.createdDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="task.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${taskInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'events', 'error')} ">
	<label for="events">
		<g:message code="task.events.label" default="Events" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${taskInstance?.events?}" var="e">
    <li><g:link controller="taskEvent" action="show" id="${e.id}">${e?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="taskEvent" action="create" params="['task.id': taskInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'taskEvent.label', default: 'TaskEvent')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'files', 'error')} ">
	<label for="files">
		<g:message code="task.files.label" default="Files" />
		
	</label>
	<g:select name="files" from="${com.TechnoPM.Project.File.list()}" multiple="multiple" optionKey="id" size="5" value="${taskInstance?.files*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="task.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${taskInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'project', 'error')} required">
	<label for="project">
		<g:message code="task.project.label" default="Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="project" name="project.id" from="${com.TechnoPM.Project.Project.list()}" optionKey="id" required="" value="${taskInstance?.project?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'requirment', 'error')} required">
	<label for="requirment">
		<g:message code="task.requirment.label" default="Requirment" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="requirment" name="requirment.id" from="${com.TechnoPM.Project.Requirement.list()}" optionKey="id" required="" value="${taskInstance?.requirment?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: taskInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="task.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="status" name="status.id" from="${com.TechnoPM.Project.Status.list()}" optionKey="id" required="" value="${taskInstance?.status?.id}" class="many-to-one"/>
</div>

