# Laboratorio-DBA

# Informe final.

#### Alumno: Gustavo Adolfo Ortiz Orona

## 1\. Introducción

Durante las actividades se analizó cómo proteger la información personal almacenada en una base de datos. Se identificaron riesgos relacionados con el acceso no autorizado, el uso incorrecto de los datos y su conservación durante demasiado tiempo.

El objetivo fue proponer medidas para mejorar la privacidad, la seguridad y la administración de la información.

## 2\. Inventario de datos

Se identificaron los siguientes datos en la tabla **clientes**:

* **id**: identificador interno.  
* **nombre**: dato personal de identificación.  
* **correo y telefono**: datos de contacto.  
* **rfc**: dato de identificación fiscal.  
* **edad**: dato personal.  
* **ciudad y codigo\_postal**: datos de ubicación.  
* **fecha\_alta**: fecha de registro del cliente.

Los datos de identificación y contacto requieren especial protección, ya que pueden utilizarse para identificar a una persona.

## 3\. Finalidades

Los datos deben utilizarse únicamente para actividades justificadas, como:

* **Atención al cliente:** utilizar el nombre y los medios de contacto para atender dudas, solicitudes y problemas relacionados con los servicios.  
* **Facturación y obligaciones fiscales:** utilizar los datos fiscales y de identificación que sean necesarios para elaborar comprobantes y cumplir con las obligaciones correspondientes.  
* **Administración de clientes:** utilizar el identificador interno y la fecha de alta para organizar los registros y administrar la relación comercial.  
* **Análisis estadístico:** utilizar información agrupada, como la cantidad de clientes por ciudad o por rango de edad, para conocer tendencias generales.  
* **Marketing y promociones:** utilizar los medios de contacto únicamente cuando exista una finalidad válida, se cumplan las obligaciones de información aplicables y se respeten las preferencias y derechos de los clientes.


## 4\. Minimización

La minimización consiste en recopilar y utilizar únicamente la información necesaria para cumplir con una finalidad determinada. Durante las actividades se identificó que almacenar demasiados datos aumenta los riesgos de privacidad y seguridad. Si una persona no necesita consultar cierta información para realizar su trabajo, no existe una razón suficiente para darle acceso a ella.

En la tabla clientes, el nombre, correo y teléfono podrían ser necesarios para ciertas tareas de atención al cliente, mientras que el RFC puede ser necesario para actividades fiscales específicas. 

Para los análisis estadísticos, se pueden sustituir las edades individuales por rangos, como 18 a 30 años, 31 a 45 años y 46 años o más. También puede utilizarse una agrupación geográfica en lugar del código postal completo.

Ya en la eliminación de un campo debe realizarse únicamente después de confirmar que no es necesario para las operaciones, las obligaciones legales o las relaciones con otras tablas.

## 5\. Control de acceso

El control de acceso permite establecer qué usuarios pueden consultar, modificar o administrar la información. Durante las actividades se revisó que no todos los trabajadores necesitan los mismos permisos. Se propuso organizar los accesos mediante roles de PostgreSQL, relacionando cada permiso con las responsabilidades de los usuarios

**Atención al cliente:** consulta y actualización de datos necesarios para atender solicitudes.

**Facturación:** acceso a los datos necesarios para sus procesos.

**Analistas:** consulta de vistas con información agrupada.

**Auditoría:** revisión de registros de accesos y cambios.

**Administrador:** gestión de usuarios, permisos y configuración de la base de datos.

Como parte del ejercicio se planteó un rol de analista con el atributo NOLOGIN y una vista llamada v\_analitica\_clientes. La intención es permitir que el análisis se realice sobre información preparada para ese propósito, sin dar acceso directo a toda la tabla clientes.

## 

## 

## 

## 6\. Derechos ARCO

Los derechos ARCO son los derechos de Acceso, Rectificación, Cancelación y Oposición que permiten a las personas ejercer control sobre sus datos personales, conforme a la normativa aplicable. Durante las actividades se identificó que atender estos derechos requiere procedimientos organizados y mecanismos técnicos dentro de la base de datos.

### **Acceso**

Aqui permite que la persona solicite conocer qué datos personales tiene la empresa sobre ella y la información correspondiente a su tratamiento..

### **Rectificación**

Permitira solicitar la corrección de datos personales que sean incorrectos, incompletos o estén desactualizados.

### **Cancelación**

Permite solicitar que los datos personales dejen de ser tratados cuando corresponda conforme a la normativa aplicable.

También debe determinarse si existen obligaciones legales que justifiquen conservar ciertos datos durante un periodo adicional. Cuando corresponda, puede ser necesario bloquearlos para impedir su uso ordinario antes de eliminarlos definitivamente, conforme a las reglas aplicables.

### **Oposición**

Permite que la persona se oponga a determinados usos de sus datos cuando se cumplan las condiciones previstas en la normativa.

### **Implicaciones técnicas generales**

Para atender los derechos ARCO se propone:

* Contar con un procedimiento para recibir, verificar y responder solicitudes.  
* Mantener mecanismos de búsqueda de registros asociados a una persona.  
* Registrar las modificaciones y acciones realizadas cuando sea necesario.  
* Revisar las tablas relacionadas y los sistemas donde se encuentren copias de los datos.  
* Limitar el acceso a la información durante la atención de una solicitud.  
* Definir cómo se aplicarán las solicitudes en respaldos y sistemas externos.

## 

## 7\. Retención

Los datos no deben conservarse indefinidamente sin justificación. El periodo debe establecerse según la finalidad, las necesidades operativas y las obligaciones legales.

Cuando la información deje de ser necesaria, se debe evaluar si corresponde eliminarla, bloquearla o conservarla por una obligación aplicable. Durante las actividades se identificó que conservar todos los datos indefinidamente puede aumentar los riesgos de acceso, filtración y uso no autorizado

## 8\. Gobierno de datos

A continuación presentamos la matriz de responsabilidad mencionado en la actividad anterior: 

| Dato | Finalidad | Responsable | Usuarios autorizados | Protección | Retención | Acción al finalizar |
| :---- | ----- | ----- | ----- | ----- | ----- | ----- |
| **nombre** | Identificar al cliente y brindarle atención. | Atención al cliente | Atención al cliente, cuando sea necesario y DBA para tareas técnicas autorizadas. | Control de acceso mediante roles y permisos. | Necesario para el servicio y durante el periodo legal aplicable. | Eliminar o anonimizar cuando ya no sea necesario y no exista obligación de conservarlo. |
| **correo** | Contactar al cliente y enviar información relacionada con el servicio. | Atención al cliente | Atención al cliente y personal autorizado que necesite comunicarse con el cliente. | Permisos limitados y protección de la información almacenada. | Sera  necesario para la comunicación y durante el periodo aplicable. | Eliminar cuando deje de ser necesario, salvo que exista una obligación de conservación. |
| **telefono** | Comunicarse con el cliente si tiene dudas. | Atención al cliente | Atención al cliente y personal autorizado. | Acceso restringido y uso únicamente para fines autorizados. | Mientras sea necesario para la atención y conforme a las obligaciones aplicables. | Eliminar cuando deje de ser necesario, salvo que deba conservarse legalmente. |
| **rfc** | Identificar fiscalmente al cliente y realizar procesos de facturación. | Facturación | Facturación y personal fiscal autorizado. El DBA solo para tareas técnicas justificadas. | Acceso restringido, permisos específicos y protección de los datos almacenados. | Durante el periodo requerido por las obligaciones fiscales y legales. | Eliminar o bloquear su uso cuando corresponda, respetando las obligaciones de conservación. |
| **edad** | Elaborar estadísticas y conocer la distribución de edades de los clientes. | Analítica | Analítica mediante rangos de edad y Dirección mediante estadísticas agregadas. | Generalización por rangos y restricción del acceso a datos individuales. | Mientras sea necesaria para la finalidad establecida. | Eliminar el dato individual o conservar estadísticas adecuadamente anonimizadas. |
| **ciudad** | Conocer la ubicación general de los clientes y generar estadísticas. | Atención al cliente y Analítica | Atención al cliente cuando sea necesario. | Acceso limitado y agrupación de datos para estadísticas. | Mientras sea necesaria para el servicio o para análisis justificados. | Eliminar cuando deje de ser necesaria o conservar estadísticas agregadas. |
| **codigo\_postal** | Validar información de domicilio cuando sea necesario. | Atención al cliente y Analítica | Personal autorizado que necesite el dato y Analítica mediante regiones agrupadas. | Restricción de permisos y generalización de la información geográfica. | Durante el tiempo necesario para la finalidad correspondiente y las obligaciones legales. | Eliminar el dato individual o generalizarlo para estadísticas cuando sea apropiado. |

Ya con la matriz se propone mantener registros de los permisos otorgados, revisar periódicamente las cuentas activas y retirar los accesos cuando una persona cambie de puesto o deje de necesitarlos.

## 9\. Evaluación integral

Los principales riesgos identificados fueron:

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

## 10\. Conclusiones

Con estas actividades aprendí que administrar una base de datos no consiste solamente en almacenar información, sino también en protegerla y controlar su uso.

La privacidad, la seguridad y la administración deben trabajar en conjunto. Es importante recopilar solo los datos necesarios, asignar permisos adecuados, proteger las conexiones y definir cuánto tiempo se conservará la información.

También comprendí que atender los derechos ARCO requiere revisar los datos en todos los sistemas involucrados y que cada área debe tener responsabilidades claras. Estas medidas ayudan a reducir riesgos y a manejar la información personal de forma responsable. Finalmente, entendí que el gobierno de datos permite organizar las responsabilidades y mantener un control más claro sobre todo el ciclo de vida de la información. La empresa debe saber qué datos tiene, por qué los utiliza, quién es responsable de ellos y qué debe hacer cuando dejan de ser necesarios.

### Preguntas de Reflexion.

#### 1.¿Una base de datos técnicamente segura necesariamente cumple con todos los requisitos de privacidad?

No en sí, una base de datos puede tener contraseñas seguras, cifrado y permisos adecuados, pero aun así puede utilizar los datos para finalidades incorrectas o conservarlos más tiempo del necesario.

#### 2.¿Por qué el principio de mínimo privilegio también contribuye a la privacidad?

Porque cada usuario solamente puede acceder a la información que necesita para realizar su trabajo. Esto reduce la posibilidad de que consulte o utilice datos personales innecesariamente

#### 3.¿Por qué el DBA no debería decidir por sí solo la finalidad del tratamiento de los datos?

Porque el DBA se encarga principalmente de administrar y proteger la base de datos. Las finalidades deben definirse con las áreas responsables del negocio y de privacidad, considerando las obligaciones legales.

### 4.¿Por qué los desarrolladores no deberían recibir automáticamente copias completas de bases de datos productivas?

Porque podrían acceder a información personal que no necesitan. Es preferible utilizar datos ficticios o anonimizados para realizar pruebas

### 5.¿Por qué una copia utilizada para desarrollo también puede representar un riesgo de privacidad?

Porque puede contener información real de los clientes y quedar expuesta si no tiene los mismos controles de seguridad. Además, podría almacenarse en equipos o entornos menos protegidos.

#### 6.¿Por qué la retención debe formar parte del ciclo de vida de los datos?

Porque los datos no deben conservarse para siempre sin una razón válida. Se debe definir cuánto tiempo son necesarios y qué hacer con ellos cuando dejan de serlo, considerando las obligaciones legales.

#### 7.¿Qué relación existe entre privacidad por diseño y diseño de bases de datos?

La privacidad por diseño consiste en considerar la protección de los datos desde la creación del sistema. Esto implica almacenar solamente la información necesaria, controlar los accesos y planear cómo se modificarán o eliminarán los datos.

#### 8.¿Qué controles técnicos implementarías para reducir el riesgo de exposición de datos personales?

Implementaría permisos por roles, contraseñas protegidas mediante hash, cifrado de información sensible, conexiones TLS, respaldos seguros, registros de auditoría y vistas con datos agrupados para los analistas.

#### 9.¿Qué información debería conocer un DBA para responder técnicamente a una solicitud ARCO?

Debe conocer dónde se almacenan los datos, qué tablas los contienen, qué usuarios pueden acceder, qué copias existen y cómo se realizan las modificaciones o eliminaciones. También debe conocer los respaldos y las relaciones entre tablas.

#### 10.¿Qué responsabilidades deberían corresponder al DBA, al responsable de privacidad, al área jurídica y al propietario de los datos?

**DBA**: administrar la base de datos, los permisos, los respaldos y aplicar las acciones técnicas autorizadas.  
**Responsable de privacidad**: coordinar la protección de datos y la atención de solicitudes ARCO.  
**Área jurídica**: revisar las obligaciones legales y determinar los requisitos aplicables.  
Propietario de los datos: definir las necesidades del negocio y justificar las finalidades del tratamiento junto con las áreas responsables.

Cada área debe colaborar para garantizar que los datos se utilicen correctamente y estén protegidos.