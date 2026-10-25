### Alumno: Gustavo Adolfo Ortiz Orona

### Actividad 8 — Analizar un escenario de seguridad

**Considera la siguiente situación:**  
Una empresa almacena los siguientes elementos:

* nombre  
* correo electrónico  
* contraseña  
* RFC  
* información financiera  
* claves criptográficas

La base de datos utiliza usuarios y roles correctamente.

Sin embargo:

* Las contraseñas están almacenadas en texto claro  
* El RFC está almacenado en texto claro  
* Las conexiones utilizan una configuración sin validación adecuada del servidor  
* Las claves criptográficas aparecen en archivos SQL  
* Los respaldos se almacenan sin protección adicional

#### Pregunta 1

**¿Cuáles son los principales riesgos?**

1. **La filtración de credenciales:** Donde guardar contraseñas en texto claro compromete directamente la identidad de los usuarios en esta y otras plataformas   
2. **Fuga de datos personales y sensibles:** La exposición directa del RFC y datos financieros en texto claro viola normativas legales de privacidad de datos como lo es con  LFPDPPP y expone a los clientes a fraude o robo de identidad.  
3. **Intercepción y espionaje en tránsito:** Configuran conexiones sin una validación estricta del servidor TLS **`sslmode`** que permite a un atacante en la misma red interceptar consultas, credenciales e información en texto plano.  
4. **Compromiso total del cifrado por exposición de llaves:** Incluir claves criptográficas dentro de archivos SQL las expone a repositorios de código Git, registros de ejecución, respaldos y capturas de pantalla, invalidando cualquier esfuerzo de cifrado.  
5. **Exposición ilimitada a través de respaldos:** Si un archivo de respaldo no está cifrado, cualquier persona con acceso físico o lógico al archivo puede restaurar la base de datos completa sin pasar por los controles de autenticación del motor.

#### Pregunta 2

¿Qué mecanismo utilizarías para cada elemento?

* **Contraseña:** Un Hash unidireccional con sal (salt) única por usuario, usando pgcrypto con gen\_salt('bf'))  
* **RFC:** Usaría un cifrado seguro en reposo por medio de la función **pgp\_sym\_encrypt**  
* **Conexiones:** Configuraciones obligatorias de TLS con validación estricta de certificados.  
* **Claves criptograficas:** Uso de variables de entornos restringidas, fuera de repositorios y scripts SQL  
* **Respaldos de BD**: Un Cifrado de archivos de respaldo en reposo por medio de un cifrado a nivel de almacenamiento.

#### Pregunta 3

**¿Cuál de los problemas consideras más crítico y por qué?**  
Unl problema fuera  almacenar las contraseñas en texto claro combinado con la presencia de claves criptográficas en archivos SQL.

Por que almacenar contraseñas en texto claro causa un daño irreparable y de alcance masivo ante cualquier filtración. Tambien colocar claves criptográficas dentro del código o scripts anula por completo la seguridad en capas, solo que se aplique cifrado a los datos sensibles como lo es el RFC, el atacante solo necesita leer el código o un log para obtener la llave y descifrar la base de datos completa de inmediato.

#### Pregunta 4

**¿Tener correctamente configurados los usuarios y permisos elimina estos riesgos?**  
No, no los elimina.

Justificación.  
En el ambito de protección limitado, los usuarios y permisos del SGBD como GRANT / REVOKE solo controlan quién puede realizar acciones dentro del motor de base de datos cuando está encendido y en ejecución.

Otra de ellas es la Inmunidad ante fugas externas,  no protegen contra el robo directo de un archivo de respaldo sin cifrar ni contra la filtración de un archivo .sql publicado accidentalmente en un repositorio Git.  
