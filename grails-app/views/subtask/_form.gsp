<%@ page import="com.TechnoPM.Project.Subtask" %>



<div class="fieldcontain ${hasErrors(bean: subtaskInstance, field: 'complete', 'error')} ">
	<label for="complete">
		<g:message code="subtask.complete.label" default="Complete" />
		
	</label>
	<g:checkBox name="complete" value="${subtaskInstance?.complete}" />
</div>

<div class="fieldcontain ${hasErrors(bean: subtaskInstance, field: 'creationDate', 'error')} required">
	<label for="creationDate">
		<g:message code="subtask.creationDate.label" default="Creation Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="creationDate" precision="day"  value="${subtaskInstance?.creationDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: subtaskInstance, field: 'creator', 'error')} required">
	<label for="creator">
		<g:message code="subtask.creator.label" default="Creator" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="creator" name="creator.id" from="${com.TechnoPM.Person.list()}" optionKey="id" required="" value="${subtaskInstance?.creator?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subtaskInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="subtask.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${subtaskInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: subtaskInstance, field: 'order', 'error')} required">
	<label for="order">
		<g:message code="subtask.order.label" default="Order" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="order" type="number" value="${subtaskInstance.order}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: subtaskInstance, field: 'task', 'error')} required">
	<label for="task">
		<g:message code="subtask.task.label" default="Task" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="task" name="task.id" from="${com.TechnoPM.Project.Task.list()}" optionKey="id" required="" value="${subtaskInstance?.task?.id}" class="many-to-one"/>
</div>

