-- DROP PROCEDURE estoque_teste.registrar_movimentacao(int4, int4, int4, varchar, int4, varchar, varchar, varchar);

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

END;
$procedure$
;
