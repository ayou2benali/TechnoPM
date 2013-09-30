<%@ page import="com.TechnoPM.Project.Status" %>



<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="status.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${statusInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: statusInstance, field: 'ordering', 'error')} required">
	<label for="ordering">
		<g:message code="status.ordering.label" default="Ordering" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ordering" type="number" value="${statusInstance.ordering}" required=""/>
</div>

