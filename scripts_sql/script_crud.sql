-- Inserir categorias novas
INSERT INTO categoria (nome) VALUES
()

-- Inserir itens novos
INSERT INTO item (nome, descricao, preco, material, id_categoria, id_status) VALUES
()

-- Atualizar a tabela de item (este é apenas um exemplo, utilize conforme a necessidade)
UPDATE item 
SET nome = 'Relogia de Ouro' -- Esse é apenas um exemplo, você pode alterar qualquer coluna da tabela
WHERE id_item = 2


-- Deletar linhas da tabela de itens
DELETE FROM item 
WHERE id_item = 1 -- Irá ser deletado a linha inteira onde o id_item for igual a 1