/*
* Copyright 2022 E.J.I.E., S.A.
*
* Licencia con arreglo a la EUPL, Versión 1.1 exclusivamente (la «Licencia»);
* Solo podrá usarse esta obra si se respeta la Licencia.
* Puede obtenerse una copia de la Licencia en
*
* http://ec.europa.eu/idabc/eupl.html
*
* Salvo cuando lo exija la legislación aplicable o se acuerde por escrito,
* el programa distribuido con arreglo a la Licencia se distribuye «TAL CUAL»,
* SIN GARANTÍAS NI CONDICIONES DE NINGÚN TIPO, ni expresas ni implícitas.
* Véase la Licencia en el idioma concreto que rige los permisos y limitaciones
* que establece la Licencia.
*/
package ${pojo.getPackageName()}.model;

<#assign classbody>
<#include "modelTypeDeclaration.ftl"/> {

<#if !pojo.isInterface()>
<#include "modelFields.ftl"/>

<#include "modelConstructors.ftl"/>

<#include "modelPropertyAccessors.ftl"/>

<#include "modelToString.ftl"/>

<#include "../modelEqualsHashcode.ftl"/>

<#else>
<#include "modelInterfacePropertyAccessors.ftl"/>

</#if>
<#include "../modelExtraClassCode.ftl"/>
}
</#assign>
${pojo.generateImports()}
${classbody}