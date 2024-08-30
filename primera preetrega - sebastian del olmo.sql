DROP DATABASE IF EXISTS speedcopy;
CREATE DATABASE speedcopy;
USE speedcopy;

CREATE TABLE Clientes (
    cliente_id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    email VARCHAR(100),
    PRIMARY KEY (cliente_id)
);

CREATE TABLE Proveedores (
    proveedor_id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    direccion VARCHAR(200),
    telefono VARCHAR(20),
    email VARCHAR(100),
    PRIMARY KEY (proveedor_id)
);

CREATE TABLE Productos (
    producto_id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    proveedor_id INT,
    PRIMARY KEY (producto_id)
);

CREATE TABLE Stock_Materiales (
    material_id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    proveedor_id INT,
    PRIMARY KEY (material_id)
);

CREATE TABLE Pedidos (
    pedido_id INT NOT NULL AUTO_INCREMENT,
    cliente_id INT,
    fecha_pedido DATE NOT NULL,
    fecha_entrega DATE,
    total DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (pedido_id)
);

CREATE TABLE Detalles_Pedido (
    detalle_id INT NOT NULL AUTO_INCREMENT,
    pedido_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (detalle_id)
);

ALTER TABLE productos
	ADD CONSTRAINT fk_producto_proveedor
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id);

ALTER TABLE stock_materiales
	ADD CONSTRAINT  fk_stock_proveedor
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id);

ALTER TABLE pedidos
	ADD CONSTRAINT  fk_pedidos_cliente
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id);

ALTER TABLE detalles_pedido
	ADD CONSTRAINT  fk_detalle_pedido
    FOREIGN KEY (pedido_id) REFERENCES Pedidos(pedido_id);
    
ALTER TABLE detalles_pedido
	ADD CONSTRAINT  fk_detalle_producto
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id);
