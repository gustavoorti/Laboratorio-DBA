

### 1\. Introducción

La seguridad de la información es importante para evitar que personas no autorizadas puedan acceder a datos privados. En una base de datos se pueden almacenar contraseñas, datos personales, información sensible y otros elementos que necesitan protección.

Para este laboratorio se realizaron diferentes actividades para conocer algunos mecanismos de seguridad en PostgreSQL, como la protección de contraseñas, el cifrado de datos sensibles, el uso de TLS para proteger las comunicaciones y la correcta gestión de las claves criptográficas.

### 2\. Protección de credenciales

Durante esta actividad se analiza el problema de almacenar contraseñas directamente en una tabla. Cuando una contraseña se guarda como texto claro, cualquier persona que tenga acceso de lectura a esa tabla puede verla sin dificultad.  
	  
Para evitar este problema, se utilizó la extensión pgcrypto con específicamente las funciones crypt() y gen\_salt(). Estas permiten generar una representación de la contraseña mediante un hash y comprobar posteriormente si una contraseña ingresada es correcta.

Tambien es importante distinguir entre los siguientes conceptos:

**Texto claro**: La contraseña se guardará tal como fue escrita y puede leerse directamente.  
**Hash**: genera una representación que permite verificar una contraseña sin recuperar la original.  
**Cifrado**:transforma la información para que pueda recuperarse utilizando la clave adecuada.

### 3\. Protección de datos sensibles

En esta actividad se utilizó el RFC como ejemplo de información que necesita protección adicional, debido a que es un dato personal que puede relacionarse con la identidad de una persona.

Para protegerlo, se creó una tabla llamada clientes\_protegidos, donde el campo rfc\_cifrado almacena el dato cifrado en lugar de mostrar directamente el RFC.

Se utilizó la función pgp\_sym\_encrypt() para cifrar el dato mediante una clave y pgp\_sym\_decrypt() para recuperarlo cuando se proporciona la clave correcta.

### 4\. TLS

**SHOW ssl**:  Para consultar si SSL/TLS está habilitado en el servidor.  
**SHOW ssl\_min\_protocol\_version**; para identificar la versión mínima del protocolo permitida.  
**SHOW port**; Para consultar el puerto utilizado por PostgreSQL.  
**SHOW listen\_addresses**; para revisar las direcciones en las que el servidor acepta conexiones.

También se utilizó la vista pg\_stat\_ssl para comprobar si la sesión actual utiliza TLS e identificar la versión del protocolo y el algoritmo de cifrado reportados.

La diferencia principal entre una conexión protegida con TLS y una conexión sin TLS es que TLS proporciona protección para los datos durante su transmisión. Además, cuando se configura correctamente la validación de certificados, permite comprobar la identidad del servidor.

### 5\. Gestión de claves

Las claves criptográficas son necesarias para cifrar y recuperar información protegida. Sin embargo, si se almacenan de manera incorrecta, pueden convertirse en un punto débil de la seguridad.

Durante la actividad se analizó el problema de escribir una clave directamente en una consulta SQL. Si ese archivo se publica en un repositorio GitLab, otras personas podrían obtener la clave y utilizarla para descifrar los datos que protege.

Por esta razón, las claves reales no deben almacenarse junto con el código fuente ni con los scripts que las utilizan. En un entorno productivo, deberían administrarse mediante un gestor de secretos o un servicio especializado en la gestión de claves criptográficas.

### 6\. Resultados

A partir de las actividades realizadas, se identificaron los siguientes resultados y aprendizajes:

1\. Se identificó que almacenar contraseñas en texto claro permite que cualquier persona con acceso de lectura a la tabla pueda obtenerlas directamente.  
2\. Se comprendió cómo utilizar crypt() y gen\_salt() para almacenar y verificar contraseñas mediante hash en PostgreSQL.  
3\. Comprobe el propósito del cifrado simétrico con pgp\_sym\_encrypt() y la recuperación de información mediante pgp\_sym\_decrypt().  
4\. Reconocí lo que las claves criptográficas deben mantenerse protegidas y no incluirse directamente en archivos SQL o repositorios.  
5\. Se identificó la importancia de TLS para proteger la información durante su transmisión entre el cliente y el servidor.  
6\. Se conocieron consultas de PostgreSQL que permiten revisar la configuración del servidor y el estado de seguridad de la conexión actual.  
7\. Se comprendió la importancia de revisar los archivos antes de realizar un commit para evitar publicar contraseñas, claves, tokens u otros secretos.

### 7\. Problemas encontrados

La gestión de las claves utilizadas para cifrar datos. Si se pierde la clave necesaria para descifrar la información, recuperar los datos originales puede resultar imposible. Por el contrario, si la clave queda expuesta, la información protegida puede quedar en riesgo.

### 8\. Conclusiones

Con este laboratorio aprendí que la seguridad de una base de datos no depende únicamente de configurar usuarios y permisos, sino también de proteger correctamente la información almacenada y transmitida.

Comprendí que las contraseñas no deben guardarse en texto claro, sino mediante mecanismos especializados de hash que permitan verificar su validez sin recuperar la contraseña original. También aprendí que los datos sensibles, como el RFC, pueden protegerse mediante cifrado cuando es necesario recuperar su contenido posteriormente.

Además, entendí que TLS ayuda a proteger la información durante la comunicación entre el cliente y PostgreSQL, y que es importante verificar la conexión y validar correctamente la identidad del servidor.

Finalmente, reconocí que las claves criptográficas deben manejarse con cuidado, ya que una clave expuesta puede comprometer la información que protege. En un entorno productivo aplicaría medidas como el uso de gestores de secretos, controles de acceso, respaldos protegidos, rotación de claves y revisión de los archivos antes de publicarlos en un repositorio.

### 23\. Preguntas de reflexión

**1\. ¿Por qué una contraseña no debe almacenarse como texto claro?**  
Porque cualquier persona que tenga acceso a la base de datos podría ver la contraseña directamente. Si ocurre una filtración, las cuentas de los usuarios quedarían en riesgo. 

**2\. ¿Por qué un hash no es equivalente a un cifrado?**  
Un hash genera una representación que no está diseñada para recuperar la información original, mientras que el cifrado permite recuperar los datos utilizando la clave correcta.

**3\. ¿Por qué el cifrado de una columna no sustituye al control de acceso?**  
El cifrado protege el contenido de los datos pero no controla por sí solo quién puede acceder a la tabla o utilizar la aplicación aqui es necesario establecer permisos y roles.

**4\. ¿Por qué TLS no sustituye a los mecanismos de autorización de PostgreSQL?**  
Protege la comunicación entre el cliente y el servidor, pero no determina qué acciones puede realizar cada usuario dentro de la base de datos

**5\. ¿Qué ocurriría si una organización pierde una clave utilizada para cifrar información?**  
Si la organización pierde la clave y no tiene una copia de respaldo segura, podría quedarse sin posibilidad de recuperar la información cifrada

**6\. ¿Qué ocurriría si una clave criptográfica se publica accidentalmente en GitLab?**  
Una persona podría obtener la clave y utilizarla para descifrar la información que protege. Aunque el repositorio sea privado, existe el riesgo de que alguien con acceso la copie.

**7\. ¿Por qué un repositorio privado no debe considerarse un almacén de secretos?**  
Un repositorio privado puede ser accesible para varios colaboradores y su contenido puede copiarse, descargarse o conservarse en el historial de Git. Por eso, las claves, contraseñas y tokens deben guardarse en herramientas diseñadas para administrar secretos de forma segura.

**8\. ¿Qué diferencia existe entre proteger información almacenada y proteger información durante su transmisión?**  
Proteger la información almacenada significa evitar que los datos guardados en una base de datos o en un respaldo puedan ser leídos por personas no autorizadas. En cambio, proteger la información durante su transmisión consiste en evitar que los datos sean interceptados o modificados mientras viajan entre el cliente y el servidor.

**9\. ¿Por qué la gestión de claves es tan importante como el algoritmo criptográfico?**  
Porque aunque se utilice un algoritmo seguro si la clave se guarda en un lugar inseguro o llega a manos equivocadas, la información puede quedar expuesta. Por eso también es necesario controlar el acceso a las claves, protegerlas, realizar respaldos seguros y reemplazarlas cuando exista algún riesgo.

**10\. ¿Qué mecanismo adicional implementarías en una organización para proteger los respaldos de las bases de datos?**

Implementaria el cifrado de los respaldos para evitar que otras personas puedan leer la información si obtienen una copia.