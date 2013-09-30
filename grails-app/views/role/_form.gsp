<%@ page import="com.TechnoPM.Project.Role" %>



<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="role.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${roleInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'ordering', 'error')} required">
	<label for="ordering">
		<g:message code="role.ordering.label" default="Ordering" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ordering" type="number" value="${roleInstance.ordering}" required=""/>
</div>

