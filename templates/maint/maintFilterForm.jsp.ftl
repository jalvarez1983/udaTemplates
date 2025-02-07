<%--
 -- Copyright 2022 E.J.I.E., S.A.
 --
 -- Licencia con arreglo a la EUPL, Versión 1.1 exclusivamente (la "Licencia");
 -- Solo podrá usarse esta obra si se respeta la Licencia.
 -- Puede obtenerse una copia de la Licencia en
 --
 --      http://ec.europa.eu/idabc/eupl.html
 --
 -- Salvo cuando lo exija la legislación aplicable o se acuerde por escrito,
 -- el programa distribuido con arreglo a la Licencia se distribuye "TAL CUAL",
 -- SIN GARANTÍAS NI CONDICIONES DE NINGÚN TIPO, ni expresas ni implícitas.
 -- Véase la Licencia en el idioma concreto que rige los permisos y limitaciones
 -- que establece la Licencia.
 --%>

<%@include file="/WEB-INF/includeTemplate.inc"%>

<!-- Formulario de filtrado -->
<spring:url value="${grid.url}/filter" var="url"/>
<form:form modelAttribute="${maint.modelObject?lower_case}" id="${maint.nameMaint}_filter_form" action="<#noparse>${url}</#noparse>" method="POST">
	<!-- Barra de herramientas del formulario de filtrado -->
	<div id="${maint.nameMaint}_filter_toolbar" class="formulario_legend"></div>
	<fieldset id="${maint.nameMaint}_filter_fieldset" class="rup-table-filter-fieldset">
		<div class="form-row">
			<!-- Campos del formulario de filtrado -->
			<#-- Comprobar si la primaryKey existe y no es multipk, cuando las condiciones no se cumplan, se generará el identificador por defecto -->
			<#if (maint.primaryKey)?has_content && !(maint.primaryKey)?contains(";")>
			<div class="form-groupMaterial col">
				<form:input path="${maint.primaryKey}" id="${maint.primaryKey}_filter_table"/>
				<label for="${maint.primaryKey}_filter_table">
					<spring:message code="${maint.primaryKey}"/>
				</label>
			</div>
			<#else>
			<div class="form-groupMaterial col">
				<form:input path="id" id="id_filter_table"/>
				<label for="id_filter_table">
					<spring:message code="id"/>
				</label>
			</div>
			</#if>
			<#list gridColumns as columnProperties>
				<#if (columnProperties.activated)?string == "true">
					<#if (maint.primaryKey)?has_content && !(maint.primaryKey)?contains(columnProperties.name)>
						<#switch columnProperties.editType>
							<#case "Text">
			<div class="form-groupMaterial col">
				<form:input path="${columnProperties.name}" id="${columnProperties.name}_filter_table"/>
								<#break>	
							<#case "Textarea">
			<div class="form-groupMaterial col">
				<form:textarea path="${columnProperties.name}" id="${columnProperties.name}_filter_table"/>
								<#break>	
							<#case "Checkbox">
			<div class="checkbox-material col">
				<form:checkbox path="${columnProperties.name}" id="${columnProperties.name}_filter_table"/>							
								<#break>
							<#case "Datepicker">
			<div class="form-groupMaterial col">
				<form:input path="${columnProperties.name}" id="${columnProperties.name}_filter_table"/>
								<#break>	
							<#case "Password">
			<div class="form-groupMaterial col">
				<form:input path="${columnProperties.name}" id="${columnProperties.name}_detail_table" type="password"/>
								<#break>
							<#default>
			<div class="form-groupMaterial col">
				<form:input path="${columnProperties.name}" id="${columnProperties.name}_filter_table"/>
								<#break>	
						</#switch>
				<label for="${columnProperties.name}_filter_table">
					<spring:message code="${columnProperties.label}"/>
				</label>
			</div>
					</#if>
				</#if>
			</#list>
			<!-- Fin campos del formulario de filtrado -->
		</div>
		<!-- Botonera del formulario de filtrado -->
		<div id="${maint.nameMaint}_filter_buttonSet" class="text-right">
			<!-- Botón de limpiar -->
			<button id="${maint.nameMaint}_filter_cleanButton" type="button" class="btn-material btn-material-primary-low-emphasis mr-2">
				<i class="mdi mdi-eraser"></i>
				<span>
					<spring:message code="clear"/>
				</span>
			</button>
			<!-- Botón de filtrado -->
			<button id="${maint.nameMaint}_filter_filterButton" type="button" class="btn-material btn-material-primary-low-emphasis" >
				<i class="mdi mdi-filter"></i>
				<span>
					<spring:message code="filter"/>
				</span>
			</button>
		</div>
	</fieldset>
</form:form>