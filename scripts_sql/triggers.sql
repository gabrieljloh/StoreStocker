-- Trigger: atualizar saldo de estoque automatico
CREATE OR REPLACE FUNCTION update_saldo_estoque_fn()
RETURNS TRIGGER AS $$
BEGIN
   -- Verifica se há estoque insuficiente para saída
   IF EXISTS (
        SELECT 1
        FROM saldoestoque s
        WHERE s.id_item = NEW.id_item
        AND NEW.id_tipo_mov = 2
        AND NEW.quantidade > s.quantidade
    ) THEN
        RAISE EXCEPTION 'Estoque insuficiente para saída.';
    END IF;

   -- Atualiza saldo se o item já existe
   IF EXISTS (SELECT 1 FROM saldoestoque s WHERE s.id_item = NEW.id_item) THEN
        IF NEW.id_tipo_mov = 1 THEN
            UPDATE saldoestoque
            SET quantidade = quantidade + NEW.quantidade
            WHERE id_item = NEW.id_item;
        END IF;
   -- Insere novo saldo se o item não existe
   ELSE
        IF NEW.id_tipo_mov = 1 THEN
            INSERT INTO saldoestoque (id_item, quantidade)
            VALUES (NEW.id_item, NEW.quantidade);
        END IF;
   END IF;

   -- Processa saída de estoque
   IF NEW.id_tipo_mov = 2 THEN
        UPDATE saldoestoque
        SET quantidade = quantidade - NEW.quantidade
        WHERE id_item = NEW.id_item;
   END IF;

   RETURN NEW;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trigger_update_saldo_estoque
AFTER INSERT OR UPDATE ON moviestoque
FOR EACH ROW
EXECUTE FUNCTION update_saldo_estoque_fn();