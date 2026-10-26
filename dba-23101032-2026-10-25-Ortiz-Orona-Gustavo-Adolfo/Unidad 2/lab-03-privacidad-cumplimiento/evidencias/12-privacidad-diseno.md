# 18\. Actividad 12 — Privacidad por diseño

## Alumno: Gustavo Adolfo Ortiz Orona.

### Analiza el siguiente escenario:

Una nueva aplicación requiere registrar clientes.

El desarrollador propone:

CREATE TABLE clientes (  
    id BIGSERIAL,  
    nombre TEXT,  
    correo TEXT,  
    telefono TEXT,  
    rfc TEXT,  
    edad INTEGER,  
    direccion TEXT,  
    ciudad TEXT,  
    codigo\_postal TEXT,  
    fecha\_nacimiento DATE,  
    ocupacion TEXT,  
    salario NUMERIC,  
    estado\_civil TEXT,  
    ...  
);

#### La justificación es:

**“Es mejor guardar todos los datos por si posteriormente necesitamos alguno.”**

### Preguntas: 

#### ¿Qué problemas identificas?

El principal problema es que se quieren guardar demasiados datos personales sin saber si realmente serán necesarios.

#### ¿Qué principio de privacidad se está ignorando?

Aqui se está ignorando el principio de minimización de datos donde solo se necesita recopilar la información necesaria para cumplir con una finalidad específica. También se relaciona con la privacidad por diseño, porque la protección de los datos debe considerarse desde el desarrollo de la aplicación y no agregarse después

#### ¿Qué preguntas realizarías antes de aprobar el diseño?

\- Para qué se necesita cada dato?  
\- ¿Quién tendrá acceso a esta información?  
\- ¿Durante cuánto tiempo se conservarán los datos?  
\- ¿Qué medidas se utilizarán para protegerlos?

#### ¿Qué datos eliminarías?

Eliminaría del diseño mostrado algunos campos que no tengan una finalidad o proposito definido que no sean necesarios para el servicio.  
algunos de los campos a eliminar serían la fecha\_nacimiento si basta con conocer un rango de edad, y no incluiría tampoco la direccion si no se necesita para entregar productos o prestar el servicio

#### ¿Qué datos requerirían una justificación adicional?

Sepíran los campos rfc, fecha\_nacimiento, ocupacion, salario, estado\_civil y direccion, ya que requieren una justificación clara antes de incorporarse,debido a que contienen información que podría ser innecesaria para el registro básico de un cliente.

#### ¿Cómo aplicarías privacidad por defecto?

Aplicaría privacidad por defecto mediante las siguientes medidas:  
\- Solicitar únicamente los datos indispensables para registrar al cliente.  
\- Mantener los datos personales restringidos y protegidos.  
\- Establecer periodos de retención para eliminar los datos cuando dejen de ser necesarios.  
\- Evitar compartir información personal con otras áreas o sistemas sin una finalidad justificada.  
\- Utilizar información agrupada o anonimizada cuando se necesiten estadísticas.

### Objetivo

Comprender la importancia de aplicar la privacidad desde el diseño de una aplicación, identificando qué datos personales son realmente necesarios y cuáles podrían representar riesgos si se recopilan sin una finalidad clara.

### Procedimiento

Primero, revisé la propuesta de la tabla clientes y los campos que el desarrollador quería almacenar. Después, analicé qué información sería necesaria para el funcionamiento de la aplicación y qué datos podrían recopilarse sin una justificación suficiente.

### Resultado

Se identificó que la propuesta original incluye varios datos que podrían no ser necesarios para el registro de clientes. Se determinó que cada campo debe tener una finalidad definida y que es preferible diseñar una tabla que almacene únicamente la información indispensable

### Análisis

Con esta actividad comprendí que guardar todos los datos por si acaso no es una buena práctica, porque aumenta la cantidad de información que la empresa debe proteger. Considero que es mejor analizar las necesidades de la aplicación desde el principio y evitar recopilar información.

### Conclusión

Esta actividad me permitió entender que la privacidad debe tomarse en cuenta desde el desarrollo de una aplicación. No se trata solamente de proteger los datos después de recopilarlos, sino también de decidir cuáles son necesarios, quién puede consultarlos y cuánto tiempo deben conservarse.