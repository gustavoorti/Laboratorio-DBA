## Alumno: Gustavo Adolfo Ortiz Orona \- 23101032

## 18\. Verificación final

**Antes de terminar, comprueba que puedes responder correctamente:**

### Credenciales

**¿Una contraseña debe cifrarse o protegerse mediante un mecanismo de derivación de claves para contraseñas?**  
Una contraseña debe protegerse mediante un mecanismo de derivación de claves, como lo es con  bcrypt,  esto les permite guardar una representación de la contraseña sin tener que almacenar la original.De  esta manera, si alguien obtiene acceso a la base de datos no podrá ver directamente las contraseñas.

### Datos sensibles

**¿Qué diferencia existe entre enmascaramiento, seudonimización y cifrado?**  
El enmascaramiento oculta parte de la información,llegando a solo  mostrar los últimos cuatro dígitos de una tarjeta.Y con  la seudonimización reemplaza datos que identifican a una persona por otros valores, como un código.Como ultimo dato, el cifrado transforma la información para que solamente pueda leerse utilizando la clave correspondiente.

### Comunicaciones

**¿Qué problema resuelve TLS?**  
El TLS protege la información que viaja entre un cliente y un servidor. Esto evita que otras personas puedan leer fácilmente los datos durante la comunicación y ayuda a detectar si fueron modificados.

### Claves

**¿Dónde debería almacenarse una clave criptográfica en un entorno real?**

Una clave criptográfica debería guardarse en un lugar seguro, como un gestor secreto o un servicio especializado para administrar claves. No debería ponerse directamente en el código del programa ni subirse a GitLab.