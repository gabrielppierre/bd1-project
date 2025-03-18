SELECT g.nome AS grupo, g.cidade_origem, a.ordem_apresentacao, 
       a.duracao, e.tipo AS tipo_evento
FROM Grupo_Maracatu g
JOIN Apresenta a ON g.id_grupo = a.id_grupo
JOIN Evento e ON a.id_evento = e.id_evento
WHERE e.id_evento = 1
ORDER BY a.ordem_apresentacao;