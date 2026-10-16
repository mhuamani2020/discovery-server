package com.nttdata.discovery_server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 * Clase principal del servidor de descubrimiento de servicios (Eureka Server).
 * <p>
 * Actúa como registro central donde los microservicios del banco (por
 * ejemplo, customer-service y api-gateway) se dan de alta para poder
 * localizarse entre sí en tiempo de ejecución.
 *
 * @author NTT Data
 */
@EnableEurekaServer
@SpringBootApplication
public class DiscoveryServerApplication {

    /**
     * Punto de entrada de la aplicación Spring Boot.
     *
     * @param args argumentos de línea de comandos proporcionados al arrancar
     */
    public static void main(String[] args) {
        SpringApplication.run(DiscoveryServerApplication.class, args);
    }

}
