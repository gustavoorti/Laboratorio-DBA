## **Alumno: Gustavo Adolfo Ortiz Orona**

## **Actividad 5 — Analizar una finalidad secundaria**

### **Analiza la situación.**

#### **Responde las siguientes preguntas.**

##### 1.¿El hecho de que la organización ya tenga los datos significa automáticamente que puede utilizarlos para cualquier finalidad?

No, ya que los datos se recopilaron para ciertos propósitos y no significa que se puedan utilizar para cualquier otra cosa Debido a que antes de usarlos para enviar promociones, se tiene que revisar si ese uso está permitido y si cumple con las reglas.

##### 2.¿Qué preguntas debería realizar la organización antes de implementar este tratamiento?

Podrían preguntar si los clientes fueron informados sobre el uso de sus datos para promociones, o si es necesario obtener su autorización, sobre qué información se podrá utilizar, cómo se protegerá y si realmente es necesario guardar todos esos datos para realizar esta actividad.

##### 3.¿Qué datos serían realmente necesarios?

Se podrían utilizar la edad o el rango de edad, la ciudad. Aqui no sería necesario utilizar todos los datos personales si se puede cumplir con el objetivo usando menos información.

##### 4.¿Necesitaría el área de marketing acceso directo a clientes?

No, debido a que el marketing podría trabajar con información agrupada para identificar tendencias y preferencias.

##### 5.¿Qué controles técnicos podrían limitar la información entregada?

El utilizar los roles y permisos en la bd, ya sea con vistas que muestren únicamente los datos necesarios, consultas con información filtrada, anonimización o generalización de datos.

### **Objetivo:**

Poder comprender la importancia de separar la información de los clientes según la finalidad para la que se utiliza, estableciendo controles de acceso para proteger los datos personales y analizar si es correcto utilizarlos.

### **Procedimiento:** 

Primero se revisó qué información necesita el área de Analítica para generar estadísticas, utilizando consultas SQL para agrupar a los clientes por ciudad, rango de edad y codigo postal. Después se creó un rol llamado **analista\_2** y una vista que muestra únicamente la información necesaria.

### **Resultado:** 

Se propuso una forma de limitar el acceso mediante roles y vistas en la BD.

### **Análisis:** 

Ya casi para terminar, con esta actividad comprendí que no basta con tener los datos almacenados en la bd, sino que también es importante controlar cómo se utilizan y quién puede consultarlos.

### **Conclusión:** 

Esta actividad me permitió comprender que la protección de los datos personales puede depender tanto de la forma en que se almacenan como de la manera en que se utilizan. Separar la información por finalidad y establecer permisos adecuados ayuda a mantener un mejor control de la base de datos.  
