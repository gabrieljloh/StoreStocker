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
SELECT i.nome, https://github.com/gabrieljloh/StoreStocker.git
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

-- ***SELECTS criados a partir das 6 Perguntas de negócios

--1. Qual o item mais movimentado nos últimos 30 dias (independente do tipo de movimentação)?

WITH MovimentacoesRecentes AS (
  SELECT 
    ms.id_item,
    tm.tipo_nome,  -- Tipo de movimentação (entrada ou saída)
    SUM(ms.quantidade) AS total_movimentado
  FROM 
    moviestoque ms
  JOIN 
    tipomov tm ON ms.id_tipo_mov = tm.id_tipo_mov
  WHERE 
    ms.data_movi >= CURRENT_DATE - INTERVAL '30 days'
  GROUP BY 
    ms.id_item, tm.tipo_nome
)
SELECT 
  i.nome AS item_nome,
  m.tipo_nome AS tipo_movimentacao,
  m.total_movimentado
FROM 
  MovimentacoesRecentes m
JOIN 
  item i ON m.id_item = i.id_item
ORDER BY 
  m.total_movimentado DESC
LIMIT 1;

--2. Qual é o histórico de movimentações de cada item do estoque?

SELECT 
  i.nome AS item_nome,
  tm.tipo_nome AS tipo_movimento,
  ms.quantidade,
  ms.data_movi
FROM 
  moviestoque ms
JOIN 
  item i ON ms.id_item = i.id_item
JOIN 
  tipomov tm ON ms.id_tipo_mov = tm.id_tipo_mov
WHERE 
  ms.id_item IN (SELECT id_item FROM item)  
ORDER BY 
  ms.data_movi;

--3. Qual o item mais movimentado, do tipo SAÍDA, nos últimos 30 dias?

WITH MovimentacoesRecentes AS (
  SELECT 
    ms.id_item,
    SUM(ms.quantidade) AS total_saida
  FROM 
    moviestoque ms
  WHERE 
    ms.data_movi >= CURRENT_DATE - INTERVAL '30 days'
    AND ms.id_tipo_mov = 2  
  GROUP BY 
    ms.id_item
),
RankedMovimentacoes AS (
  SELECT 
    m.id_item,
    m.total_saida,
    ROW_NUMBER() OVER (ORDER BY m.total_saida DESC) AS rank
  FROM 
    MovimentacoesRecentes m
)
SELECT 
  i.nome AS item_nome, 
  r.total_saida
FROM 
  RankedMovimentacoes r
JOIN 
  item i ON r.id_item = i.id_item
WHERE 
  r.rank = 1;

-- 4. Qual é a média de movimentação de entrada e saída por item no último ano?

WITH MediaMovimentacao AS (
  SELECT 
    ms.id_item,
    AVG(CASE WHEN ms.id_tipo_mov = 1 THEN ms.quantidade ELSE 0 END) AS media_entrada,
    AVG(CASE WHEN ms.id_tipo_mov = 2 THEN ms.quantidade ELSE 0 END) AS media_saida
  FROM 
    moviestoque ms
  WHERE 
    ms.data_movi >= CURRENT_DATE - INTERVAL '1 year'
  GROUP BY 
    ms.id_item
)
SELECT 
  i.nome AS item_nome,
  m.media_entrada,
  m.media_saida
FROM 
  MediaMovimentacao m
JOIN 
  item i ON m.id_item = i.id_item
ORDER BY 
  (m.media_entrada + m.media_saida) DESC
LIMIT 5;

--5. Quais os 5 itens em menor quantidade dentro do estoque?

WITH SaldoEstoque AS (
  SELECT 
    ms.id_item,
    i.nome AS item_nome,
    SUM(CASE WHEN ms.id_tipo_mov = 1 THEN ms.quantidade ELSE -ms.quantidade END) AS saldo
  FROM 
    moviestoque ms
  JOIN 
    item i ON ms.id_item = i.id_item
  GROUP BY 
    ms.id_item, i.nome
),
RankingEstoque AS (
  SELECT 
    item_nome,
    saldo,
    DENSE_RANK() OVER (ORDER BY saldo ASC) AS ranking
  FROM 
    SaldoEstoque
)
SELECT 
  item_nome,
  saldo,
  ranking
FROM 
  RankingEstoque
WHERE 
  ranking <= 5
ORDER BY 
  saldo ASC;

--6. Quais os 5 itens com maior variação de saldo (entrada/saída) nos últimos 30 dias?

WITH MovimentacoesVariação AS (
  SELECT 
    ms.id_item,
    SUM(CASE WHEN ms.id_tipo_mov = 1 THEN ms.quantidade ELSE 0 END) AS total_entradas,
    SUM(CASE WHEN ms.id_tipo_mov = 2 THEN ms.quantidade ELSE 0 END) AS total_saidas
  FROM 
    moviestoque ms
  WHERE 
    ms.data_movi >= CURRENT_DATE - INTERVAL '30 days'
  GROUP BY 
    ms.id_item
),
RankingMovimentacoes AS (
  SELECT 
    i.nome AS item_nome, 
    (m.total_entradas - m.total_saidas) AS variacao_saldo,
    RANK() OVER (ORDER BY (m.total_entradas - m.total_saidas) DESC) AS ranking
  FROM 
    MovimentacoesVariação m
  JOIN 
    item i ON m.id_item = i.id_item
)
SELECT 
  item_nome, 
  variacao_saldo,
  ranking
FROM 
  RankingMovimentacoes
WHERE 
  ranking <= 5
ORDER BY 
  ranking;
