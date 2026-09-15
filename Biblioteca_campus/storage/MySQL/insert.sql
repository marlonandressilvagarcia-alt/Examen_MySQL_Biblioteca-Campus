USE Examen;

-- Inserción de Libros
INSERT INTO Libro (id_libro, titulo, genero, isbn, disponibilidad) VALUES
(1, 'Cien Años de Soledad', 'Realismo Mágico', '978-0307474728', TRUE),
(2, 'Don Quijote de la Mancha', 'Novela', '978-8424922498', TRUE),
(3, 'El Aleph', 'Ficción', '978-8420633114', TRUE),
(4, 'Ficciones', 'Ficción', '978-0307950925', FALSE),
(5, 'La Ciudad y los Perros', 'Novela', '978-8420471830', TRUE);

-- Inserción de Autores
INSERT INTO Autor (id_autor, nombre, nacionalidad) VALUES
(1, 'Gabriel García Márquez', 'Colombiana'),
(2, 'Miguel de Cervantes', 'Española'),
(3, 'Jorge Luis Borges', 'Argentina'),
(4, 'Mario Vargas Llosa', 'Peruana');

-- Relación Libro - Autor
INSERT INTO LibroAutor (id_libro_autor, id_libro, id_autor) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 3),
(5, 5, 4);

-- Inserción de Ediciones
INSERT INTO Edicion (id_edicion, id_libro, numero_edicion, fecha_publicacion, editor) VALUES
(1, 1, 1, '1967-05-30', 'Editorial Sudamericana'),
(2, 1, 2, '2007-03-01', 'Real Academia Española'),
(3, 2, 1, '1605-01-16', 'Juan de la Cuesta'),
(4, 3, 1, '1949-06-15', 'Editorial Losada'),
(5, 4, 1, '1944-01-01', 'Editorial Sur'),
(6, 5, 1, '1963-10-01', 'Editorial Seix Barral');

-- Inserción de Miembros
INSERT INTO Miembro (id_miembro, nombre, email, telefono, fecha_registro) VALUES
(1, 'Carlos Gómez', 'carlos.gomez@email.com', '3001234567', '2024-01-15'),
(2, 'Ana Martínez', 'ana.martinez@email.com', '3119876543', '2024-02-10'),
(3, 'Luis Fernández', 'luis.fernandez@email.com', '3205551234', '2024-03-05');

-- Inserción de Transacciones
INSERT INTO Transaccion (id_transaccion, id_libro, id_miembro, fecha_prestamo, fecha_devolucion, estado) VALUES
(1, 1, 1, '2024-05-01', '2024-05-15', 'Devuelto'),
(2, 2, 2, '2024-04-10', '2024-04-20', 'Devuelto'),
(3, 4, 3, '2024-05-10', NULL, 'Prestado');
