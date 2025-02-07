<#-- 
* Copyright 2023 E.J.I.E., S.A.
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
 -->
package ${PACKAGE_NAME};

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ejie.x38.hdiv.annotation.UDALink;

@Controller
public class MvcController {
	private static final Logger logger = LoggerFactory.getLogger(MvcController.class);

	@UDALink(name = "getErrorView")
	@RequestMapping(value = "/error")
	public String getErrorView(Model model, HttpServletRequest request) {
		logger.error("Ha ocurrido un error...");
		return "error";
	}
}
