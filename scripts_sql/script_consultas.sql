-- Ficha técnica dos itens cadastrados
SELECT i.nome, i.descricao, i.preco, i.material, c.nome AS categoria, s.status_nome AS status FROM item i 
	INNER JOIN categoria c 
	ON i.id_categoria = c.id_categoria 
	INNER JOIN status s 
	ON i.id_status = s.id_status 
