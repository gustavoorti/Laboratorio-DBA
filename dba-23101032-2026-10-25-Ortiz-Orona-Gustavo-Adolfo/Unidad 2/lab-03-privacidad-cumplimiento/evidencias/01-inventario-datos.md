## Alumno: Gustavo Adolfo Ortiz Orona

## Actividad 1 — Inventario y finalidad de los datos

### Objetivo: 

Poder identificar que los datos personales que son manejados por la empresa Comercializadora Norte S.A. de C.V., sea para conocer para qué se utiliza cada uno, cuáles son necesarios y qué personas o áreas deberían tener acceso a ellos.

### Procedimiento

Primero revisé los campos que se encuentran en la base de datos de los clientes, luego, analicé para qué sirve cada dato con base a los laboratorios pasados y si es necesario para las actividades de Atención al cliente, Facturación y Analítica.

Les asigné un nivel de acceso según las necesidades de cada área y propuse un tiempo de retención para evitar que la información se conserve más tiempo del necesario.

### Resultado

Como tal ya se cuenta con  una tabla con el inventario de los datos personales de los clientes, donde se especifica su finalidad, necesidad, nivel de acceso y retención. 

### Análisis

Al realizar esta actividad, me di cuenta de que no todos los datos almacenados en la base de datos son necesarios para todas las áreas de una empresa. Aqui ya entraría la asignaciones de necesidades para las diferentes áreas dependiendo que es lo que ocuparan.

### Completa la siguiente matriz

| Campo | ¿Es dato personal? | Finalidad | ¿Es necesario? | Nivel de acceso | Retención |
| ----- | ----- | ----- | ----- | ----- | ----- |
| **id** | Si pero de manera indirecta, porque el id identifica un registro asociado a una persona. | Poder identificar y relacionar los registros de los cliente. | Asi es, para administrar la base de datos. | Atención al cliente, Facturación. Analítica. | Mientras exista la relación con el cliente y durante el periodo requerido para conservar los registros. |
| **nombre** | Sí, porque permite identificar a una persona. | Lograr identificar al cliente durante la atención. | Si para la Atención al cliente y Facturación. | Atención al cliente y Facturación. El DBA solo cuando sea necesario por motivos técnicos. | Mientras sea necesario para el servicio y durante el periodo legal aplicable. |
| **correo** | Sí porque permite contactar o identificar al cliente. | Enviar la información, responder consultas y mantener comunicación con el cliente. | Si para Atención al cliente, para otros procesos dependiendo su finalidad. | Atención al cliente y personal autorizado que necesite contactar al cliente. | si es necesario para la comunicación y conforme a las obligaciones aplicables. |
| **telefono** | Si porque permite contactar directamente al cliente. | Realizar llamadas o comunicarse para resolver consultas. | Si cuando la atención requiera comunicación telefónica. | Atención al cliente y personal autorizado que lo necesite. | Mientras sea necesario para la atención y durante el periodo de conservación establecido. |
| **rfc** | si ya que es un identificador fiscal vinculado a una persona física. | Identificar fiscalmente al cliente y emitir comprobantes cuando corresponda. | Sí, para los procesos de facturación que lo requieran. | Exclusivamente Facturación y personal fiscal autorizado. | Durante el periodo exigido por las obligaciones fiscales y legales. |
| **edad** | Sí, porque es información relacionada con una persona. | Elaborar estadísticas demográficas. | No es indispensable para la atención ni para la facturación ordinaria. | Analítica mediante datos agregados; acceso individual restringido cuando sea posible. | Hasta que se generen las estadísticas necesarias o durante el periodo justificado. |
| **ciudad** | Sí, porque puede contribuir a identificar a una persona al combinarse con otros datos. | Conocer la ubicación general del cliente y generar estadísticas geográficas. | No siempre ya que depende de las necesidades del servicio y de los análisis realizados. | Atención al cliente cuando sea necesario y Analítica mediante información agregada. | Mientras sea necesaria para el servicio o para producir estadísticas justificadas. |
| **codigo\_postal** | si porque puede ayudar a localizar o identificar a una persona al combinarse con otros datos. | Validar información de domicilio y generar estadísticas geográficas. | Aqui solo cuando se requiera para un proceso específico.  | Personal autorizado que necesite el dato. | Durante el tiempo necesario para la finalidad correspondiente y las obligaciones legales aplicables. |
| **fecha\_alta** | Sí, porque está asociada al registro de un cliente identificable. | Conocer cuándo se registró el cliente, administrar su antigüedad y elaborar estadísticas de altas. | Sí, para el control de registros; para Analítica puede utilizarse de forma agregada. | Atención al cliente cuando sea necesario, personal administrativo autorizado y Analítica con acceso limitado. | Mientras el registro sea necesario y durante el periodo de conservación establecido por la organización. |

## Conclusión

Con esta actividad comprendí que es importante llevar un control de los datos personales que maneja una empresa, saber para qué se utilizan y quién puede consultarlos. Esto es importante porque ayuda a proteger la información de los clientes y a evitar accesos innecesarios. 

