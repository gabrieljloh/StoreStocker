-- Essa procedura facilita a inserção dos dados em saldoestoque

CREATE OR REPLACE PROCEDURE estoque_teste.registrar_movimentacao(IN p_id_item integer, IN p_id_tipo_mov integer, IN p_quantidade integer, IN p_tipo_documento character varying, IN p_numero_nota integer DEFAULT NULL::integer, IN p_motivo_balanco character varying DEFAULT NULL::character varying, IN p_nome_cliente character varying DEFAULT NULL::character varying, IN p_metodo_pagamento character varying DEFAULT NULL::character varying)
 LANGUAGE plpgsql
AS $procedure$
DECLARE
    v_id_documento INT;
    v_id_venda INT;
BEGIN
    -- Verifica se a quantidade é válida
    IF p_quantidade <= 0 THEN
        RAISE EXCEPTION 'A quantidade deve ser maior que zero.';
    END IF;

    -- Caso 'nota_fiscal'
    IF p_tipo_documento = 'nota_fiscal' THEN
        IF p_numero_nota IS NULL THEN
            RAISE EXCEPTION 'O número da nota fiscal deve ser informado para este tipo de documento.';
        END IF;

        INSERT INTO documento (id_entrada_saida, numero_nota)
        VALUES (3, p_numero_nota)
        RETURNING id_documento INTO v_id_documento;

    -- Caso 'balanco'
    ELSIF p_tipo_documento = 'balanco' THEN
        IF p_motivo_balanco IS NULL THEN
            RAISE EXCEPTION 'O motivo do balanço deve ser informado para este tipo de documento.';
        END IF;

        INSERT INTO documento (id_entrada_saida, motivo_balanco)
        VALUES (1, p_motivo_balanco)
        RETURNING id_documento INTO v_id_documento;

    -- Caso 'venda'
    ELSIF p_tipo_documento = 'venda' THEN
        IF p_nome_cliente IS NULL OR p_metodo_pagamento IS NULL THEN
            RAISE EXCEPTION 'Nome do cliente e método de pagamento devem ser informados para vendas.';
        END IF;

        -- Primeiro insere os dados na tabela 'venda'
        INSERT INTO venda (nome_cliente, metodo_pagamento)
        VALUES (p_nome_cliente, p_metodo_pagamento)
        RETURNING id_venda INTO v_id_venda;

        -- Em seguida, insere os dados na tabela 'documento'
        INSERT INTO documento (id_entrada_saida, id_venda)
        VALUES (2, v_id_venda)
        RETURNING id_documento INTO v_id_documento;

    ELSE
        RAISE EXCEPTION 'Tipo de documento inválido: %', p_tipo_documento;
    END IF;

    -- Insere os dados na tabela 'moviestoque'
    INSERT INTO moviestoque (id_item, id_tipo_mov, id_entrada_saida, id_documento, quantidade)
    VALUES (
        p_id_item, 
        p_id_tipo_mov, 
        CASE p_tipo_documento
            WHEN 'nota_fiscal' THEN 3
            WHEN 'balanco' THEN 1
            WHEN 'venda' THEN 2
        END,
        v_id_documento,
        p_quantidade
    );

    RAISE NOTICE 'Movimentação registrada com sucesso. Documento ID: %, Item ID: %', v_id_documento, p_id_item;

END;
$procedure$
;

-- Nota fiscal
CALL estoque_teste.registrar_movimentacao(
    p_id_item := 1, 
    p_id_tipo_mov := 3, 
    p_quantidade := 5, 
    p_tipo_documento := 'nota_fiscal', 
    p_numero_nota := 1001
);

-- Balanço
CALL estoque_teste.registrar_movimentacao(
    p_id_item := 1, 
    p_id_tipo_mov := 4, 
    p_quantidade := 50, 
    p_tipo_documento := 'balanco', 
    p_motivo_balanco := 'Ajuste de estoque'
);

-- Venda
CALL estoque_teste.registrar_movimentacao(
    p_id_item := 1, 
    p_id_tipo_mov := 2, 
    p_quantidade := 3, 
    p_tipo_documento := 'venda', 
    p_nome_cliente := 'João da Silva', 
    p_metodo_pagamento := 'Cartão de Crédito'
);
