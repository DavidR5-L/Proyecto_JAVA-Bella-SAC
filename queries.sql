SELECT 
    l.codigo_lote_prod,
    l.fecha_inicio,
    l.especie_maderable,
    l.procedencia,
    l.estado,
    u.nombre AS responsable
FROM lote_produccion l
INNER JOIN usuario u ON l.id_usuario_responsable = u.id_usuario
WHERE l.procedencia = 'UCAYALI'
ORDER BY l.fecha_inicio ASC;
