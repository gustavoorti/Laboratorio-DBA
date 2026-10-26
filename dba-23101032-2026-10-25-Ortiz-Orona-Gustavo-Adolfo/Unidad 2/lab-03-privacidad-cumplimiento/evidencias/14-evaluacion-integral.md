# 20\. Actividad 14 — Escenario integral

## Alumno: Gustavo Adolfo Ortiz Orona

# **20\. Actividad 14 — Escenario integral**

## **Identificación de problemas y riesgos**

| Problemas | Principio afectado | Riesgo | Control propuesto |
| :---- | ----- | ----- | ----- |
| 1\. Todo el personal de Analítica puede consultar la tabla completa de clientes. | Mínimo privilegio. | Acceso innecesario a datos personales de los clientes. | Crear un rol para Analítica y otorgarle acceso únicamente a una vista con la información necesaria. |
| 2\. Analítica puede consultar nombres, correos, teléfonos y RFC, aunque solo genera estadísticas. | Minimización de datos. | Exposición de información que no se necesita para realizar los análisis. | Utilizar consultas agregadas por ciudad y rango de edad, sin mostrar datos que identifiquen a los clientes. |
| 3\. Los datos se conservan desde hace 12 años sin una política de retención. | Limitación del plazo de conservación. | Mantener información durante más tiempo del necesario aumenta los riesgos de filtración. | Definir periodos de retención según la finalidad y las obligaciones legales aplicables. |
| 4\. No existe una política documentada de retención. | Responsabilidad y gestión de datos. | No saber cuándo revisar, eliminar o conservar la información. | Crear una política escrita con plazos, responsables y procedimientos para eliminar o conservar datos. |
| 5\. Los desarrolladores reciben copias completas de la base de datos. | Minimización y mínimo privilegio. | Más personas y sistemas quedan expuestos a información personal. | Proporcionar únicamente los datos necesarios para las pruebas, evitando entregar copias completas. |
| 6\. Las copias de desarrollo contienen información real. | Privacidad desde el diseño y seguridad. | Una filtración durante las pruebas podría exponer los datos de clientes reales. | Utilizar datos ficticios o datos adecuadamente anonimizados para desarrollo y pruebas. |
| 7\. Marketing utiliza los correos para campañas promocionales sin que exista documentación clara. | Limitación de la finalidad y transparencia. | Utilizar los datos para un propósito que no se haya informado o que no esté permitido. | Revisar la finalidad original, informar adecuadamente a los clientes y comprobar los requisitos legales aplicables antes de realizar las campañas. |
| 8\. No existe documentación que relacione cada dato con su finalidad. | Responsabilidad y limitación de la finalidad. | Los datos pueden utilizarse para actividades que no justifican su recopilación. | Elaborar una matriz de gobierno de datos con finalidad, responsable, usuarios autorizados y periodo de retención. |
| 9\. No se mencionan controles específicos para proteger los datos personales. | Seguridad y confidencialidad. | Posibles accesos no autorizados, filtraciones o modificaciones indebidas. | Aplicar roles, permisos, contraseñas seguras, cifrado cuando corresponda y registros de auditoría. |
| 10\. No se especifica cómo se controlan las copias de la base de datos. | Seguridad y ciclo de vida de los datos. | Las copias pueden permanecer almacenadas sin control o ser utilizadas por personas no autorizadas. | Mantener un inventario de copias, restringir su acceso y establecer procedimientos de conservación y eliminación. |

### Objetivo

Identificar los principales problemas relacionados con el manejo de los datos personales en la empresa, tomando en cuenta los accesos, el tiempo de conservación, las copias de desarrollo y el uso de la información para diferentes finalidades.

## Procedimiento

Se identificaron los problemas que podrían afectar la privacidad y la seguridad de los clientes. Para cada problema, indiqué el principio afectado, el riesgo que representa y un control que podría ayudar a prevenirlo o reducirlo.

## Resultado

Se identificaron los 10 problemas. Entre los que se encuentran el acceso directo de Analítica a toda la tabla, la conservación de información durante 12 años sin una política documentada y el uso de datos reales en las copias de desarrollo.

## Análisis

Al analizar este escenario, me di cuenta de que los problemas no se encuentran solamente en la bd, sino también en la forma en que la empresa administra y utiliza la información.

También considero que conservar datos durante muchos años sin revisar si todavía son necesarios puede aumentar los riesgos.

## Conclusión

Esta actividad me permitió comprender que proteger los datos personales requiere aplicar varias medidas al mismo tiempo. No basta con tener una base de datos segura si no que también es necesario controlar quién accede a ella, evitar el uso innecesario de información real, establecer periodos de retención y revisar las finalidades de cada tratamiento.