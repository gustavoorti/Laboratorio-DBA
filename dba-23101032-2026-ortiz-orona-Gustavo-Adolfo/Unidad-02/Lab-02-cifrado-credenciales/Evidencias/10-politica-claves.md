### Alumno: Gustavo Adolfo Ortiz Orona \- 23101032

### Actividad 10 — Crear una política mínima de protección de claves

#### Define una política de entre 5 y 10 reglas para la gestión de claves criptográficas.

**Debe considerar como mínimo:**

* Generación  
* almacenamiento  
* acceso  
* rotación  
* respaldo  
* revocación  
* exposición accidental  
* eliminación

**Ejemplo de principio:**

Las claves criptográficas no deben almacenarse en el mismo repositorio que contiene el código o los scripts que utilizan dichas claves.

**No copies únicamente el ejemplo. Formula tus propias reglas.**

#### Reglas de la política

##### 1\. Generación segura de claves

Las claves criptográficas deben generarse mediante herramientas o sistemas confiables que utilicen métodos aleatorios seguros. No se deben utilizar contraseñas personales, palabras comunes ni valores fáciles de adivinar como claves de cifrado.

##### 2\. Almacenamiento protegido

Las claves deben guardarse en sistemas diseñados para administrar secretos, como gestores de claves o servicios especializados. No deben almacenarse junto con los datos cifrados ni incluirse directamente en archivos SQL o repositorios Git.

##### 3\. Control de acceso

El acceso a las claves debe limitarse únicamente a los usuarios, aplicaciones o administradores que realmente las necesiten para realizar sus funciones.

##### 4\. Rotación periódica

Las claves deben reemplazarse de acuerdo con una política establecida y siempre que exista sospecha de que fueron comprometidas. Cuando se cambie una clave utilizada para cifrar información, se debe planificar la actualización de los datos para evitar perder la posibilidad de recuperarlos.

##### 5\. Respaldo seguro

Deben mantener respaldos protegidos de las claves cuando sean necesarios para recuperar información cifrada ante una falla. Estos respaldos deben contar con controles de acceso y protección adecuados.

##### 6\. Revocación de claves comprometidas

Si una clave se pierde, se expone o se sospecha que fue utilizada por una persona no autorizada, debe deshabilitarse o revocarse lo antes posible.

##### 7\. Prevención y respuesta ante exposiciones accidentales

Si una clave aparece accidentalmente en un repositorio, archivo de configuración, registro de ejecución o captura de pantalla, debe considerarse comprometida. Se debe restringir su uso, reemplazarla y revisar dónde fue expuesta.

##### 8\. Eliminación segura

Cuando una clave deje de utilizarse, debe eliminarse de los sistemas activos y de las ubicaciones donde ya no sea necesaria, siguiendo procedimientos seguros. También se deben considerar las copias de respaldo y los requisitos de conservación para evitar que una clave obsoleta permanezca accesible.  
