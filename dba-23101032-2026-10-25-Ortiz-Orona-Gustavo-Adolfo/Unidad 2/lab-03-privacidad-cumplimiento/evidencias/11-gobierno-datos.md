## Alumno: Gustavo Adolfo Ortiz Orona.

## 17\. Actividad 11 — Diseñar una matriz de gobierno de datos

## Construye una matriz para los principales campos de la tabla.

| Dato | Finalidad | Responsable | Usuarios autorizados | Protección | Retención | Acción al finalizar |
| :---- | ----- | ----- | ----- | ----- | ----- | ----- |
| **nombre** | Identificar al cliente y brindarle atención. | Atención al cliente | Atención al cliente, cuando sea necesario y DBA para tareas técnicas autorizadas. | Control de acceso mediante roles y permisos. | Necesario para el servicio y durante el periodo legal aplicable. | Eliminar o anonimizar cuando ya no sea necesario y no exista obligación de conservarlo. |
| **correo** | Contactar al cliente y enviar información relacionada con el servicio. | Atención al cliente | Atención al cliente y personal autorizado que necesite comunicarse con el cliente. | Permisos limitados y protección de la información almacenada. | Sera  necesario para la comunicación y durante el periodo aplicable. | Eliminar cuando deje de ser necesario, salvo que exista una obligación de conservación. |
| **telefono** | Comunicarse con el cliente si tiene dudas. | Atención al cliente | Atención al cliente y personal autorizado. | Acceso restringido y uso únicamente para fines autorizados. | Mientras sea necesario para la atención y conforme a las obligaciones aplicables. | Eliminar cuando deje de ser necesario, salvo que deba conservarse legalmente. |
| **rfc** | Identificar fiscalmente al cliente y realizar procesos de facturación. | Facturación | Facturación y personal fiscal autorizado. El DBA solo para tareas técnicas justificadas. | Acceso restringido, permisos específicos y protección de los datos almacenados. | Durante el periodo requerido por las obligaciones fiscales y legales. | Eliminar o bloquear su uso cuando corresponda, respetando las obligaciones de conservación. |
| **edad** | Elaborar estadísticas y conocer la distribución de edades de los clientes. | Analítica | Analítica mediante rangos de edad y Dirección mediante estadísticas agregadas. | Generalización por rangos y restricción del acceso a datos individuales. | Mientras sea necesaria para la finalidad establecida. | Eliminar el dato individual o conservar estadísticas adecuadamente anonimizadas. |
| **ciudad** | Conocer la ubicación general de los clientes y generar estadísticas. | Atención al cliente y Analítica | Atención al cliente cuando sea necesario. | Acceso limitado y agrupación de datos para estadísticas. | Mientras sea necesaria para el servicio o para análisis justificados. | Eliminar cuando deje de ser necesaria o conservar estadísticas agregadas. |
| **codigo\_postal** | Validar información de domicilio cuando sea necesario. | Atención al cliente y Analítica | Personal autorizado que necesite el dato y Analítica mediante regiones agrupadas. | Restricción de permisos y generalización de la información geográfica. | Durante el tiempo necesario para la finalidad correspondiente y las obligaciones legales. | Eliminar el dato individual o generalizarlo para estadísticas cuando sea apropiado. |

### Objetivo: 

Diseñar una matriz de gobierno de datos para la empresa Comercializadora Norte S.A, identificando la finalidad de cada dato personal, quién es responsable de su manejo, qué usuarios pueden acceder a él y cómo debe protegerse y conservarse

### Procedimiento: 

Se revisaron los principales datos almacenados en la tabla de clientes, como nombre, correo, teléfono, RFC, edad, ciudad y código postal. Después, se definió la finalidad de cada campo y se asignaron las áreas responsables y los usuarios autorizados según las actividades que realizan.

### Resultado: 

Obtuvimos una matriz de datos que establece cómo debe manejarse cada campo de la tabla de clientes. En ella se especifican su finalidad, los responsables, los usuarios autorizados, las medidas de protección, el tiempo de conservación y las acciones que se deben realizar al finalizar dicho periodo

### Análisis: 

Con esta actividad comprendí que no todos los usuarios necesitan acceder a la misma información. Teniendo en cuenta cualquier rol como lo puede ser el de Facturación, ellos necesita consultar el RFC, mientras que Analítica puede trabajar con rangos de edad y regiones sin tener acceso a todos los datos personales.

### Conclusión: 

Esta actividad me permitió entender la importancia de establecer reglas claras para el manejo de los datos personales dentro de una empresa. Definir responsables, permisos y medidas de protección ayuda a que la información se utilice correctamente y se conserve solamente durante el tiempo necesario