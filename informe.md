***Fecha: 17 de octubre 2026***

***Alumno: Gustavo Adolfo Ortiz Orona***

***Informe***

***19.1 Clasificación de los datos***
Del siguiente laboratorio realizado se creó una tabla llamada clientes, que etsta tendria información como el nombre, correo, teléfono, RFC, edad, ciudad, código postal y fecha de alta. 
Luego de validar los campos por medio de la matriz al inicio me fui guiado por los campos que necesitan mayor protección siendo el nombre, el correo, teléfono y RFC, ya que esto permite identificaar directamente al cliente. tambien por otra parte, la edad, la ciudad, el código postal y la fecha de alta requiere atencion, porque al combinarse pueden ayudar a identificar a una persona.


***19.2 Enmascaramiento***
En esta actividad se creó una tabla/vista llamada v_clientes_soporte, con el objetivo de que el personal de ***soporte*** lograra consultar la información de los clientes sin visualizar completos sus datos personales.
Se oculto el correo, teléfono y RFC. Se utilizo funciones de PostgreSQL como left, rigth, susbtring, pisition y concat. Con estas funciones permitieron mostrar algunos caracteres y reemplazar el resto por asteriscos.
Este mecanismo está dirigido al rol soporte, al que se le concedió permiso para consultar la vista, pero no podra acceder a la tabla original clientes.ya con eso el personal puede realizar consultas básicas sin tener que visualizar todos los datos personales.
El enmascaramiento aqui es muy importante ya que no basta con ocultar la información desde la interfaz de una aplicación. También se deben controlar los permisos en la DB para evitar que un usuario pueda consultar directamente los datos completos.


***19.3 Seudonimización***

Aqui se busco separar la identidad de los clientes reales en ser utilizada para realizar analisiss, para esto, se crearon los esquemas pii y analitica para poder organizar por separado la información que permite identificar a los clientes y los datos destinados al análisis.
Se creo la tabla de ***pii.mapa_cliente*** que relaciona un token con el identificador original de cada cliente. Los tokens se generaron mediante la función ***gen_random_uuid()***.
lueg de eso se creó la tabla ***analitica.clientes***, que contiene el token de cada cliente junto con su edad, ciudad, codigo postal y fecha de alta.De esto se excluyeron el nombre, correo, teléfono y el RFC para evitar que el conjunto analítico contuviera directamente esos identificadores.
El mapa de correspondencia se encuentra en pii.mapa_cliente y debe estar disponible únicamente para personal autorizado que realmente necesite relacionar los tokens con los clientes originales. Asi que por el rol de ***analista*** debe poder consultar solo los datos necesarios para realizar sus estudios.
Esta separación aplica el principio de mínimo privilegio donde cada usuario recibe solamente los permisos que necesita.


***19.4 Anonimización***

Se genero información estadística para que pudieran conocer algunos datos generales de los clientes sin consultar sus registros individuales. Para lograrlo, se utilizaron consultas SQL que agrupan la información y muestran cantidades en lugar de datos personales completos.
Como primer paso: se generalizó la edad mediante rangos de edad, como 18-30, 31-45 y 46. Después de esto se utilizaron los primeros dos dígitos del código postal para agrupar a los clientes por región.Como paso final: se combinaron ambos atributos para observar cuántas personas pertenecían a cada grupo.
También se aplicó un filtro con HAVING COUNT(*) >= 5 que nos permitira mostrar únicamente los grupos que contienen cinco o más registros.
Con los valores mas indentificables, como el nombre, correo, teléfono y RFC, no se incluyeron en las consultas estadísticas. Sin embargo, permanecieron algunos datos que podrían contribuir a la reidentificación, como la edad generalizada y la región.
La generalización de grupos pequeños ayudan a reducir el riesgo de reidentificación, pero esto no nos garantizara que los datos sean completamente anónimos, para mejorar la protección, se pueden utilizar rangos más amplios y regiones menos específicas.


***19.5 Retención de datos***

Como paso final se trabajó con la retención de datos, donde el propósito es establecer cuánto tiempo debe conservarse la información de los clientes y determinar cuándo 
puede dejar de ser necesaria.
Se estableció un periodo de conservación de cinco años, donde se utilizó una consulta de lectura para poder identificar los registros cuya fecha de alta fuera anterior a la fecha actual menos cinco años.

El criterio utilizado fue la antigüedad de la fecha de alta. Sin embargo, en una situación real esto no sería loideal de tomar en cuenta solo ese dato, tamboe debemos de revisar si la informacion sigue siendo la necesario para la orgniazacion o si eciste reglas donde sea necesarios conservarlos por mas tiempo.
Aunque antes de eliminar esa informacon, primero hay que tener la autorizacion de un responsabe para comprobar que los datos puedas eliminarse y tener una copia por si pasara algo mas adelante.
Si se eliminara información por accidente se podria recuperar a partir de un respaldo, siempre que este contenga los datos necesarios. 


***19.6 Conclusiones***

Por medio del siguiente conclucion, me llevo que la la protección de la información personal en BD se debe adaptar al perfil de uso de cada área operativa para equilibrar la privacidad con la funcionalidad de cada sistema que se tenga.
Como en el caso del área de soporte donde usando la técnica adecuada con el enmascaramiento mediante la creación de vistas, lo que me permitio realizar la validación operativa mostrando únicamente caracteres parciales de los campos sensibles correo, teléfono y RFC sin exponer la información completa. Tambien por otra parte, el área de analítica con la técnica de la seudonimización la cual  identidad el usuario reemplazando los identificadores directos por tokens por medio de esquemas separados esto puede permitir estudiar tendencias sin comprometer la identidad de los clientes. teniendo comp objetivo la publicación de estadísticas, esto se debe recurrir a la anonimización mediante la agrupación de valores como se realizo con rango de edad y regiones por código postal, asegurando que no sea posible reidentificar a ningún individuo.

Por ello me llevo conmigo lo fundamental lo que son estas técnicas de transformación de datos puedan sutituir al control de acceso, enmascaramiento, seudonimización y la anonimización que modifican la forma en que se presentan o estructuran los datos.



***Preguntas de Reflexion***

***1. ¿Cuál es la diferencia entre enmascaramiento y seudonimización?***
El enmascaramiento consta de poder ocultr una pare de los datos para que no puedaan ser vsualizados de manera completo y con la seudonimización es sustituir la identidad de los clientes por medio de algun identificador con el nombre de token que se puede relacionar con el cliente mediante un mapa de correspondencia.


***2. ¿Por qué la seudonimización no significa anonimización?***
Luego de que sustituya la identidad por el token, aun existe una forma de poderlo relacionar con el cliente orginial mediante un mapa de correspondencia, si en dado caso se tuviera una persona np autorizada con los acceso a ese mapa o tabla, pued consultar los datos reales de los clientes. Con la anonimización lo que se logra esperar es impedir que una persona/cliente pueda ser identificada.


***3. ¿Por qué eliminar nombre y RFC no garantiza que un conjunto de datos sea anónimo?***
Estan otros datos con los que pueden identificar a un cliente, por medio de la edad, ciudad, codigo postal, con estos datos se puede combinar con informacion externa y podrian localizar a un cliente. Es por esp que eliminando los identificadores directos no es suficiente para tener un anonimato.


***4. ¿Qué función tienen los cuasi-identificadores?***
No identifican directamente a una persona pero que pueden ayudar a reconocerla cuando se combinan con otros atributos.


***5. ¿Por qué es importante separar el mapa de seudonimización?***
Por que el mapa contiene la relación entre los tokens y los identificadores originales de los clientes, al almacenarlo por separado se reduce la posibilidad de que una persona que consulta los datos analíticos pueda descubrir la identidad de los clientes.


***6. ¿Qué principio de seguridad se aplica al impedir que el analista acceda al mapa?***
Se aplica el principio de mínimo privilegio, que consiste en otorgar a cada usuario solamente los permisos necesarios para realizar sus actividades.


***7. ¿Por qué una vista puede ser preferible a entregar acceso directo a la tabla?***
Porque una vista permite mostrar solo los campos y la información que necesita un usuario, sin darle acceso directo a todos los datos almacenados en la tabla original


***8. ¿Qué diferencia existe entre proteger un dato para visualización y protegerlo contra acceso no autorizado?***
Para proteger un dato de visualización significa ocultar o modificar la forma en que se muestra y Protegerlo contra el acceso no autorizado significa impedir que usuarios sin permiso puedan consultar el dato original.


***9. ¿Por qué la retención forma parte de la protección de datos?***
Porque permite establecer cuánto tiempo debe conservarse la información y cuándo debería revisarse para determinar si todavía es necesaria. Mantener datos personales durante más tiempo del requerido puede aumentar los riesgos de filtraciones y accesos no autorizados.


***10. ¿Qué riesgo existe si una organización conserva información indefinidamente?***
Si una organización conserva información sin definir tiempo, aumenta la cantidad de datos que podrían quedar expuestos ante un ataque, una filtración o un acceso no autorizado