CREATE DATABASE IF NOT EXISTS produccion_triplay_ucayali;
USE produccion_triplay_ucayali;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rol ENUM('SUPERVISOR','OPERADOR','ALMACENERO','CALIDAD') NOT NULL
);

CREATE TABLE lote_produccion (
    id_lote_prod INT AUTO_INCREMENT PRIMARY KEY,
    codigo_lote_prod VARCHAR(50) NOT NULL UNIQUE,
    fecha_inicio DATE NOT NULL,
    especie_maderable VARCHAR(100) NOT NULL,
    procedencia VARCHAR(100) NOT NULL DEFAULT 'UCAYALI',
    tipo_producto VARCHAR(50) NOT NULL DEFAULT 'TRIPLAY',
    estado ENUM('ARMADO','PRENSADO','ENCUADRADO','LIJADO','CLASIFICADO') NOT NULL DEFAULT 'ARMADO',
    id_usuario_responsable INT NOT NULL,
    CONSTRAINT fk_lote_usuario
        FOREIGN KEY (id_usuario_responsable)
        REFERENCES usuario(id_usuario)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

