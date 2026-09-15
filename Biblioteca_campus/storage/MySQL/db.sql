
USE Examen;

-- Tabla Libro
CREATE TABLE Libro (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    disponibilidad BOOLEAN DEFAULT TRUE
);

-- Tabla Autor
CREATE TABLE Autor (
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(50) NOT NULL
);

-- Tabla Intermedia LibroAutor (N:M)
CREATE TABLE LibroAutor (
    id_libro_autor INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT NOT NULL,
    id_autor INT NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro) ON DELETE CASCADE,
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor) ON DELETE CASCADE
);

-- Tabla Edicion
CREATE TABLE Edicion (
    id_edicion INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT NOT NULL,
    numero_edicion INT NOT NULL,
    fecha_publicacion DATE NOT NULL,
    editor VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro) ON DELETE CASCADE
);

-- Tabla Miembro
CREATE TABLE Miembro (
    id_miembro INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    fecha_registro DATE NOT NULL
);

-- Tabla Transaccion
CREATE TABLE Transaccion (
    id_transaccion INT AUTO_INCREMENT PRIMARY KEY,
    id_libro INT NOT NULL,
    id_miembro INT NOT NULL,
    fecha_prestamo DATE NOT NULL,
    fecha_devolucion DATE,
    estado VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_libro) REFERENCES Libro(id_libro) ON DELETE CASCADE,
    FOREIGN KEY (id_miembro) REFERENCES Miembro(id_miembro) ON DELETE CASCADE
);
