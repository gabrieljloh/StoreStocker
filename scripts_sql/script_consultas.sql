-- Ficha técnica dos itens cadastrados
SELECT i.nome, 
				i.descricao, 
				i.preco, 
				i.material, 
				c.nome AS nome_categoria,
				s.status_nome 
			FROM item i 
	INNER JOIN categoria c 
	ON i.id_categoria = c.id_categoria 
	INNER JOIN status s 
	ON i.id_status = s.id_status 


	-- Verificar saldo de estoque do item e sua categoria
	SELECT i.nome, 
					c.nome AS nome_categoria, 
					s.quantidade 
				FROM saldoestoque s
		INNER JOIN item i
		ON s.id_item = i.id_item
		INNER JOIN categoria c 
		ON i.id_categoria = c.id_categoria

-- Verificar movimentações de estoque por data
SELECT i.nome, 
				t.tipo_nome, 
				e.entrada_saida_nome, 
				m.quantidade, 
				m.data_movi 
			FROM moviestoque m 
	INNER JOIN item i
	ON m.id_item = i.id_item
	INNER JOIN tipomov t
	ON m.id_tipo_mov = t.id_tipo_mov
	INNER JOIN entradasaida e
	ON m.id_entrada_saida = e.id_entrada_saida
	WHERE m.data_movi = '2024-01-01' -- Selecione aqui a data que deseja consultar

-- Verificar todas as vendas por data
SELECT i.nome, 
				m.quantidade, 
				m.data_movi, 
				v.nome_cliente, 
				v.metodo_pagamento 
			FROM venda v
	INNER JOIN documento d
	ON v.id_venda = d.id_venda
	INNER JOIN moviestoque m
	ON d.id_documento = m.id_documento
	INNER JOIN item i
	ON m.id_item = i.id_item
	WHERE m.data_movi = '2024-01-01' -- Selecione aqui a data que deseja consultar

-- Verificar movimentação de estoque por tipo de entrada ou saída
SELECT i.nome, 
				t.tipo_nome, 
				e.entrada_saida_nome, 
				m.quantidade, 
				m.data_movi 
			FROM moviestoque m 
	INNER JOIN item i
	ON m.id_item = i.id_item
	INNER JOIN tipomov t
	ON m.id_tipo_mov = t.id_tipo_mov
	INNER JOIN entradasaida e
	ON m.id_entrada_saida = e.id_entrada_saida
	WHERE m.id_entrada_saida = 2 -- As opções são, 1 para balanço, 2 para venda e 3 para nota fiscal

-- Verificar movimentações de balanço
SELECT i.nome, 
				t.tipo_nome, 
				e.entrada_saida_nome, 
				m.quantidade, 
				m.data_movi, 
				d.motivo_balanco 
			FROM documento d
	INNER JOIN moviestoque m
	ON d.id_documento = m.id_documento
	INNER JOIN item i
	ON m.id_item = i.id_item
	INNER JOIN tipomov t
	ON m.id_tipo_mov = t.id_tipo_mov
	INNER JOIN entradasaida e
	ON m.id_entrada_saida = e.id_entrada_saida
	WHERE m.id_entrada_saida = 1  -- 1 é o código ID de balanço

-- Verificar movimentações de nota fiscal
SELECT i.nome, 
				t.tipo_nome, 
				e.entrada_saida_nome, 
				m.quantidade, 
				m.data_movi, 
				d.numero_nota 
			FROM documento d
	INNER JOIN moviestoque m
	ON d.id_documento = m.id_documento
	INNER JOIN item i
	ON m.id_item = i.id_item
	INNER JOIN tipomov t
	ON m.id_tipo_mov = t.id_tipo_mov
	INNER JOIN entradasaida e
	ON m.id_entrada_saida = e.id_entrada_saida
	WHERE m.id_entrada_saida = 3  -- 3 é o código ID de balanço

	-- Verificar movimentações de estoque por entrada ou saída do estoque
SELECT i.nome, 
				t.tipo_nome, 
				e.entrada_saida_nome, 
				m.quantidade, 
				m.data_movi 
			FROM moviestoque m 
	INNER JOIN item i
	ON m.id_item = i.id_item
	INNER JOIN tipomov t
	ON m.id_tipo_mov = t.id_tipo_mov
	INNER JOIN entradasaida e
	ON m.id_entrada_saida = e.id_entrada_saida
	WHERE m.id_tipo_mov = 1 -- Selecione 1 para ver as entradas e 2 para as saídas
