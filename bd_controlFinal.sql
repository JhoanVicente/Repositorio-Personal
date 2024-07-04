CREATE DATABASE defaultdb

USE defaultdb

CREATE TABLE Proveedores (
    ID_Proveedor INT PRIMARY KEY,
    RUC VARCHAR(20) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Dirección VARCHAR(255),
    Teléfono VARCHAR(20),
    Página_Web VARCHAR(100)
);

CREATE TABLE Clientes (
    ID_Cliente INT PRIMARY KEY,
    DNI VARCHAR(20) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Dirección_Calle VARCHAR(255),
    Dirección_Distrito VARCHAR(100),
    Dirección_Provincia VARCHAR(100)
);

CREATE TABLE Teléfonos (
    ID_Telefono INT PRIMARY KEY,
    ID_Cliente INT,
    Teléfono VARCHAR(20),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

CREATE TABLE Categorías (
    ID_Categoria INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Descripción VARCHAR(255)
);

CREATE TABLE Productos (
    ID_Producto INT PRIMARY KEY,
    Código_Unico VARCHAR(20) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Precio_Actual DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    ID_Categoria INT,
    ID_Proveedor INT,
    FOREIGN KEY (ID_Categoria) REFERENCES Categorías(ID_Categoria),
    FOREIGN KEY (ID_Proveedor) REFERENCES Proveedores(ID_Proveedor)
);

CREATE TABLE Ventas (
    ID_Venta INT PRIMARY KEY,
    Fecha DATE NOT NULL,
    ID_Cliente INT,
    Monto_Final DECIMAL(10, 2),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)
);

CREATE TABLE Venta_Detalle (
    ID_Venta_Detalle INT PRIMARY KEY,
    ID_Venta INT,
    ID_Producto INT,
    Cantidad INT NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (ID_Venta) REFERENCES Ventas(ID_Venta),
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto)
);











-- Inserción de datos en la tabla Proveedores
INSERT INTO Proveedores (ID_Proveedor, RUC, Nombre, Dirección, Teléfono, Página_Web) VALUES 
(1, '1234567890', 'Proveedor Uno', 'Calle 1, Distrito 1, Provincia 1', '555-1234', 'www.proveedoruno.com'),
(2, '0987654321', 'Proveedor Dos', 'Calle 2, Distrito 2, Provincia 2', '555-5678', 'www.proveedordos.com'),
(3, '1122334455', 'Proveedor Tres', 'Calle 3, Distrito 3, Provincia 3', '555-8765', 'www.proveedortres.com');

-- Inserción de datos en la tabla Clientes
INSERT INTO Clientes (ID_Cliente, DNI, Nombre, Dirección_Calle, Dirección_Distrito, Dirección_Provincia) VALUES 
(1, '111222333', 'Cliente Uno', 'Calle A', 'Distrito A', 'Provincia A'),
(2, '444555666', 'Cliente Dos', 'Calle B', 'Distrito B', 'Provincia B'),
(3, '777888999', 'Cliente Tres', 'Calle C', 'Distrito C', 'Provincia C');

-- Inserción de datos en la tabla Teléfonos
INSERT INTO Teléfonos (ID_Telefono, ID_Cliente, Teléfono) VALUES 
(1, 1, '555-1111'),
(2, 1, '555-2222'),
(3, 2, '555-3333'),
(4, 2, '555-4444'),
(5, 3, '555-5555');

-- Inserción de datos en la tabla Categorías
INSERT INTO Categorías (ID_Categoria, Nombre, Descripción) VALUES 
(1, 'Ropa Casual', 'Ropa para el día a día'),
(2, 'Ropa Deportiva', 'Ropa para hacer deporte'),
(3, 'Ropa Formal', 'Ropa para eventos formales');

-- Inserción de datos en la tabla Productos
INSERT INTO Productos (ID_Producto, Código_Unico, Nombre, Precio_Actual, Stock, ID_Categoria, ID_Proveedor) VALUES 
(1, 'P001', 'Pantalón Casual', 29.99, 50, 1, 1),
(2, 'P002', 'Camiseta Deportiva', 19.99, 30, 2, 2),
(3, 'P003', 'Vestido Formal', 49.99, 20, 3, 3),
(4, 'P004', 'Short Deportivo', 15.99, 40, 2, 1),
(5, 'P005', 'Camisa Formal', 39.99, 25, 3, 2);

-- Inserción de datos en la tabla Ventas
INSERT INTO Ventas (ID_Venta, Fecha, ID_Cliente, Monto_Final) VALUES 
(1, '2023-07-01', 1, 99.97),
(2, '2023-07-02', 2, 55.98),
(3, '2023-07-03', 3, 49.99),
(4, '2023-07-04', 1, 39.99),
(5, '2023-07-05', 2, 69.98);

-- Inserción de datos en la tabla Venta_Detalle
INSERT INTO Venta_Detalle (ID_Venta_Detalle, ID_Venta, ID_Producto, Cantidad, Precio) VALUES 
(1, 1, 1, 2, 29.99),
(2, 1, 2, 1, 19.99),
(3, 2, 4, 2, 15.99),
(4, 2, 5, 1, 39.99),
(5, 3, 3, 1, 49.99),
(6, 4, 5, 1, 39.99),
(7, 5, 2, 2, 19.99),
(8, 5, 1, 1, 29.99);
