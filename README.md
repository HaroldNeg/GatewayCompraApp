GatewayCompraApp
=================

Este repositorio contiene el microservicio `gateway-server` del sistema CompraApp. 
El gateway actúa como punto de entrada para todas las solicitudes del cliente hacia los microservicios del backend.

Descripción del Proyecto
-------------------------
El `gateway-server` es responsable de enrutar las solicitudes entrantes desde el frontend (Angular) hacia los microservicios como `productos-service` e `inventario-service`.
También maneja aspectos de seguridad, balanceo de carga, y filtrado de peticiones.

Tecnologías utilizadas
-----------------------
- Java 21
- Spring Boot 3.5.3
- Spring Cloud Gateway 2025.0.0
- Spring Security (opcional)
- Eureka Client (para descubrimiento de servicios)
- Config Client (para configuración remota)

Ejecución del Proyecto
-----------------------
1. Clonar el repositorio:
   git clone https://github.com/HaroldNeg/GatewayCompraApp.git

2. Entrar al directorio del proyecto:
   cd GatewayCompraApp

3. Compilar el proyecto con Maven:
   mvn clean install

4. Ejecutar el gateway-server:
   mvn spring-boot:run

Asegúrate de tener corriendo previamente:
- config-server
- eureka-server

Configuración
-------------
El archivo `application.yml` debe contener la configuración para:
- Puerto de entrada (por defecto 8080 o 8081)
- Rutas a los microservicios
- Registro con Eureka
- Seguridad y filtros (si aplica)

Ejemplo de ruta configurada:
```yaml
routes:
  - id: productos-service
    uri: lb://PRODUCTOS-SERVICE
    predicates:
      - Path=/api/productos/**
```

Responsabilidades del Gateway
------------------------------
- Ruteo de peticiones
- Filtros globales (logging, headers, validaciones)
- Balanceo de carga con Eureka
- Seguridad de acceso con tokens (opcional)

Observabilidad
--------------
Recomendado integrar herramientas como:
- Spring Boot Actuator
- Zipkin o Sleuth para trazabilidad
- Prometheus para métricas

Licencia
--------
Este proyecto está bajo una licencia de código abierto.

Contacto
--------
Para soporte técnico o sugerencias, abre un issue en el repositorio.
