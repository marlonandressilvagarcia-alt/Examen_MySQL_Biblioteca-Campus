Listar todos los libros disponibles
```sql
SELECT * FROM Libro WHERE disponibilidad = TRUE;

Buscar libros por género
SELECT * FROM Libro WHERE genero = 'Ficción';

Obtener información de un libro por ISBN
SELECT * FROM Libro WHERE isbn = '978-0307474728';

Contar el número de libros en la biblioteca
SELECT COUNT(*) AS total_libros FROM Libro;

Listar todos los autores
SELECT * FROM Autor;

Buscar autores por nombre
SELECT * FROM Autor WHERE nombre LIKE '%Gabriel%';

Obtener todos los libros de un autor específico
SELECT l.* 
FROM Libro l
JOIN LibroAutor la ON l.id_libro = la.id_libro
JOIN Autor a ON la.id_autor = a.id_autor
WHERE a.nombre = 'Jorge Luis Borges';

Listar todas las ediciones de un libro
SELECT e.* 
FROM Edicion e
JOIN Libro l ON e.id_libro = l.id_libro
WHERE l.titulo = 'Cien Años de Soledad';

Obtener la última edición de un libro
SELECT * 
FROM Edicion 
WHERE id_libro = 1 
ORDER BY fecha_publicacion DESC 
LIMIT 1;

Contar cuántas ediciones hay de un libro específico
SELECT COUNT(*) AS total_ediciones 
FROM Edicion 
WHERE id_libro = 1;

Listar todas las transacciones de préstamo
SELECT * FROM Transaccion;

Obtener los libros prestados actualmente
SELECT l.titulo, t.fecha_prestamo, t.estado 
FROM Libro l
JOIN Transaccion t ON l.id_libro = t.id_libro
WHERE t.estado = 'Prestado';

Contar el número de transacciones de un miembro específico
SELECT COUNT(*) AS total_transacciones 
FROM Transaccion 
WHERE id_miembro = 1;

Listar todos los miembros de la biblioteca
SELECT * FROM Miembro;

Buscar un miembro por nombre:
SELECT * FROM Miembro WHERE nombre LIKE '%Carlos%';

Obtener las transacciones de un miembro específico
SELECT t.*, l.titulo 
FROM Transaccion t
JOIN Libro l ON t.id_libro = l.id_libro
WHERE t.id_miembro = 1;

Listar todos los libros y sus autores
SELECT l.titulo, a.nombre AS autor
FROM Libro l
JOIN LibroAutor la ON l.id_libro = la.id_libro
JOIN Autor a ON la.id_autor = a.id_autor;

Obtener el historial de préstamos de un libro específico
SELECT t.*, m.nombre AS miembro
FROM Transaccion t
JOIN Miembro m ON t.id_miembro = m.id_miembro
WHERE t.id_libro = 1;

Contar cuántos libros han sido prestados en total
SELECT COUNT(DISTINCT id_libro) AS libros_prestados_total 
FROM Transaccion;

Listar todos los libros junto con su última edición y estado de disponibilidad
SELECT 
    l.titulo,
    l.disponibilidad,
    e.numero_edicion AS ultima_edicion,
    e.fecha_publicacion
FROM Libro l
LEFT JOIN Edicion e ON l.id_libro = e.id_libro
AND e.fecha_publicacion = (
    SELECT MAX(e2.fecha_publicacion) 
    FROM Edicion e2 
    WHERE e2.id_libro = l.id_libro
);
