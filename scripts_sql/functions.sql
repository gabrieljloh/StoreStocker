-- Está função faz uma consulta de todos os itens por determinada categoria e mostra seu saldo de esotque
CREATE OR REPLACE FUNCTION estoque_teste.consultar_estoque_categoria(id_categoria_param integer)
 RETURNS TABLE(item character varying, saldo integer)
 LANGUAGE plpgsql
AS $function$
BEGIN
    -- Retorna os itens da categoria e o saldo disponível
    RETURN QUERY
    SELECT i.nome, s.quantidade
    FROM item i
    JOIN saldoestoque s ON i.id_item = s.id_item
    WHERE i.id_categoria = id_categoria_param
    ORDER BY s.quantidade DESC;
END;
$function$
;