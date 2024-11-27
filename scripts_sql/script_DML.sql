-- Inserções na tabela: status
INSERT INTO status (status_nome) VALUES 
('ativo'),
('desativado');

-- Inserções na tabela: categoria
INSERT INTO categoria (nome) VALUES 
('Anéis'),
('Pulseiras'),
('Colares'),
('Brincos'),
('Relógios');

-- Inserções na tabela: tipomov
INSERT INTO tipomov (tipo_nome) VALUES 
('entrada'),
('saida');

-- Inserções na tabela: entradasaida
INSERT INTO entradasaida (entrada_saida_nome) VALUES 
('balanco'),
('venda'),
('nota_fiscal');

-- Insercões na tabela: item
INSERT INTO item (nome, descricao, preco, material, id_categoria, id_status) VALUES 
('Anel de Ouro 18k', 'Anel delicado de ouro 18k com detalhes minimalistas.', 1500.00, 'Ouro', 1, 1),
('Pulseira de Prata', 'Pulseira de prata com fecho ajustável.', 250.00, 'Prata', 2, 1),
('Colar com Pingente de Pérola', 'Colar dourado com um pingente de pérola natural.', 900.00, 'Dourado', 3, 1),
('Brinco de Diamante', 'Brinco de ouro branco com diamantes lapidados.', 2500.00, 'Ouro Branco', 4, 1),
('Relógio de Aço Inoxidável', 'Relógio resistente com design moderno.', 300.00, 'Aço', 5, 1),
('Anel com Safira', 'Anel de ouro amarelo com uma safira azul.', 3500.00, 'Ouro Amarelo', 1, 1),
('Pulseira de Couro', 'Pulseira masculina de couro legítimo.', 120.00, 'Couro', 2, 1),
('Colar de Rubi', 'Colar de prata com um pingente de rubi.', 1200.00, 'Prata', 3, 1),
('Brinco de Pérola', 'Brinco clássico com pérolas naturais.', 800.00, 'Prata', 4, 1),
('Relógio Dourado', 'Relógio elegante com acabamento dourado.', 450.00, 'Aço Dourado', 5, 1),
('Anel de Prata com Cristal', 'Anel de prata com um cristal lapidado.', 200.00, 'Prata', 1, 1),
('Pulseira com Charme', 'Pulseira de prata com charms personalizados.', 320.00, 'Prata', 2, 1),
('Colar de Topázio', 'Colar de ouro branco com uma pedra de topázio.', 1800.00, 'Ouro Branco', 3, 1),
('Brinco de Esmeralda', 'Brinco de ouro amarelo com esmeraldas brilhantes.', 2800.00, 'Ouro Amarelo', 4, 1),
('Relógio Casual', 'Relógio casual com pulseira de couro.', 200.00, 'Couro', 5, 1),
('Anel de Noivado', 'Anel de platina com um diamante central.', 4500.00, 'Platina', 1, 1),
('Pulseira de Pérolas', 'Pulseira feita de pérolas cultivadas.', 1100.00, 'Pérola', 2, 1),
('Colar com Pingente de Coração', 'Colar dourado com um pingente de coração cravejado.', 950.00, 'Dourado', 3, 1),
('Brinco de Argola', 'Brinco de argola grande com design moderno.', 300.00, 'Aço', 4, 1),
('Relógio de Luxo', 'Relógio suíço com acabamento impecável.', 5000.00, 'Ouro', 5, 1),
('Anel de Rubi', 'Anel de ouro branco com uma pedra de rubi.', 3200.00, 'Ouro Branco', 1, 1),
('Pulseira com Pedras Naturais', 'Pulseira com mix de pedras naturais coloridas.', 450.00, 'Pedras Naturais', 2, 1),
('Colar de Safira', 'Colar de ouro amarelo com uma safira brilhante.', 2800.00, 'Ouro Amarelo', 3, 1),
('Brinco com Pedras Coloridas', 'Brinco moderno com pedras coloridas variadas.', 600.00, 'Prata', 4, 1),
('Relógio Digital', 'Relógio digital esportivo com diversas funções.', 180.00, 'Plástico', 5, 1),
('Anel de Turmalina Paraíba', 'Anel exclusivo com uma turmalina Paraíba rara.', 7200.00, 'Platina', 1, 1),
('Pulseira Minimalista', 'Pulseira dourada com design clean e moderno.', 290.00, 'Dourado', 2, 1),
('Colar de Esmeralda', 'Colar de prata com um pingente de esmeralda.', 2500.00, 'Prata', 3, 1),
('Brinco de Ouro Rosé', 'Brinco pequeno com acabamento em ouro rosé.', 400.00, 'Ouro Rosé', 4, 1),
('Relógio Clássico', 'Relógio com design clássico e pulseira de aço.', 350.00, 'Aço', 5, 1),
('Anel de Cristal Azul', 'Anel de prata com cristal azul translúcido.', 220.00, 'Prata', 1, 1),
('Pulseira de Ametista', 'Pulseira de pedras de ametista roxa.', 350.00, 'Pedras Naturais', 2, 1),
('Colar de Ouro Branco', 'Colar delicado de ouro branco.', 1200.00, 'Ouro Branco', 3, 1),
('Brinco de Quartzo Rosa', 'Brinco minimalista com quartzo rosa.', 450.00, 'Prata', 4, 1),
('Relógio Esportivo', 'Relógio com pulseira de silicone e funções extras.', 290.00, 'Silicone', 5, 1),
('Anel de Platina', 'Anel clássico de platina com detalhes finos.', 4000.00, 'Platina', 1, 1),
('Pulseira Ajustável', 'Pulseira de prata ajustável para todos os tamanhos.', 150.00, 'Prata', 2, 1),
('Colar de Ouro 24k', 'Colar luxuoso de ouro 24k.', 5000.00, 'Ouro', 3, 1),
('Brinco de Zircônia', 'Brinco pequeno com zircônia brilhante.', 80.00, 'Aço', 4, 1),
('Relógio Vintage', 'Relógio clássico com pulseira de couro.', 600.00, 'Couro', 5, 1),
('Anel de Esmeralda', 'Anel de ouro amarelo com esmeralda brilhante.', 3500.00, 'Ouro Amarelo', 1, 1),
('Pulseira de Aço Inoxidável', 'Pulseira resistente com design minimalista.', 180.00, 'Aço', 2, 1),
('Colar de Prata com Diamante', 'Colar elegante com um pequeno diamante.', 2700.00, 'Prata', 3, 1),
('Brinco Geométrico', 'Brinco com formas geométricas em prata.', 200.00, 'Prata', 4, 1),
('Relógio com Cronômetro', 'Relógio moderno com função de cronômetro.', 400.00, 'Aço', 5, 1),
('Anel de Ouro Branco com Rubi', 'Anel sofisticado com rubi central.', 3200.00, 'Ouro Branco', 1, 1),
('Pulseira de Pérolas Naturais', 'Pulseira delicada de pérolas.', 800.00, 'Pérola', 2, 1),
('Colar com Pingente de Lua', 'Colar prateado com pingente em forma de lua.', 170.00, 'Prata', 3, 1),
('Brinco com Cristais Swarovski', 'Brinco brilhante com cristais Swarovski.', 350.00, 'Prata', 4, 1),
('Relógio Digital com LED', 'Relógio esportivo com iluminação LED.', 150.00, 'Plástico', 5, 1),
('Anel de Prata com Onix', 'Anel de prata com pedra onix preta.', 280.00, 'Prata', 1, 1),
('Pulseira de Madeira', 'Pulseira artesanal feita de madeira.', 120.00, 'Madeira', 2, 1),
('Colar de Ametista', 'Colar com pingente de ametista lapidada.', 500.00, 'Prata', 3, 1),
('Brinco de Ouro Amarelo', 'Brinco clássico de ouro amarelo.', 700.00, 'Ouro Amarelo', 4, 1),
('Relógio Slim', 'Relógio fino com design discreto.', 350.00, 'Aço', 5, 1),
('Anel de Prata com Jade', 'Anel de prata com jade verde.', 400.00, 'Prata', 1, 1),
('Pulseira com Pingentes', 'Pulseira com vários pingentes de prata.', 300.00, 'Prata', 2, 1),
('Colar com Cristal Negro', 'Colar prateado com um cristal negro.', 200.00, 'Prata', 3, 1),
('Brinco de Ouro Rosé com Topázio', 'Brinco elegante com topázio.', 1200.00, 'Ouro Rosé', 4, 1),
('Relógio Casual Feminino', 'Relógio com pulseira fina de couro.', 280.00, 'Couro', 5, 1),
('Anel de Prata com Turquesa', 'Anel artesanal com pedra turquesa.', 320.00, 'Prata', 1, 1),
('Pulseira de Miçangas', 'Pulseira colorida feita de miçangas.', 50.00, 'Miçangas', 2, 1),
('Colar com Medalhão Antigo', 'Colar com medalhão vintage.', 180.00, 'Prata', 3, 1),
('Brinco de Argola Pequena', 'Brinco discreto de argola prateada.', 90.00, 'Prata', 4, 1),
('Relógio com GPS', 'Relógio digital com função GPS.', 750.00, 'Plástico', 5, 1),
('Anel de Platina com Diamante', 'Anel de platina com diamante.', 5400.00, 'Platina', 1, 1),
('Pulseira de Borracha', 'Pulseira esportiva de borracha.', 80.00, 'Borracha', 2, 1),
('Colar de Ouro com Safira', 'Colar luxuoso com uma safira.', 3700.00, 'Ouro', 3, 1),
('Brinco de Ouro com Rubi', 'Brinco sofisticado com rubi.', 2200.00, 'Ouro Amarelo', 4, 1),
('Relógio de Mergulho', 'Relógio resistente à água até 200m.', 900.00, 'Aço', 5, 1),
('Anel de Aço com Design Moderno', 'Anel robusto de aço.', 150.00, 'Aço', 1, 1),
('Pulseira de Seda', 'Pulseira de seda artesanal.', 110.00, 'Seda', 2, 1),
('Colar com Pingente de Cristal', 'Colar delicado com cristal lapidado.', 250.00, 'Prata', 3, 1),
('Brinco de Ouro Branco com Pérola', 'Brinco clássico de pérola.', 1300.00, 'Ouro Branco', 4, 1),
('Relógio Moderno com Metal', 'Relógio estiloso com pulseira de metal.', 370.00, 'Aço', 5, 1),
('Anel de Prata com Opala', 'Anel artesanal com opala.', 420.00, 'Prata', 1, 1),
('Pulseira de Couro Trançado', 'Pulseira robusta de couro.', 200.00, 'Couro', 2, 1),
('Colar com Pedra da Lua', 'Colar com pingente de pedra da lua.', 380.00, 'Prata', 3, 1),
('Brinco com Design Floral', 'Brinco delicado com design floral.', 180.00, 'Prata', 4, 1),
('Relógio com Mostrador Grande', 'Relógio com números grandes para fácil leitura.', 320.00, 'Aço', 5, 1);


-- As inserções abaixo somente funcionam após a adição da trigger
-- Inserções de estoque por balanço
INSERT INTO documento (id_entrada_saida, motivo_balanco) VALUES
(1, 'Balanço de estoque'),
(1, 'Balanço de estoque'),
(1, 'Balanço de estoque'),
(1, 'Balanço de estoque'),
(1, 'Balanço de estoque'),
(1, 'Balanço de estoque'),
(1, 'Balanço de estoque');

INSERT INTO moviestoque (id_item, id_tipo_mov, id_entrada_saida, id_documento, quantidade) VALUES
(5, 1, 1, 1, 50),
(3, 1, 1, 2, 80),
(7, 1, 1, 3, 90),
(9, 1, 1, 4, 770),
(2, 1, 1, 5, 55),
(1, 1, 1, 6, 90),
(4, 1, 1, 7, 10);

-- Inserções de estoque por nota fiscal
INSERT INTO documento (id_entrada_saida, numero_nota) VALUES
(3, 180639),
(3, 180640),
(3, 180641),
(3, 180642),
(3, 180643),
(3, 180644),
(3, 180645);

INSERT INTO moviestoque (id_item, id_tipo_mov, id_entrada_saida, id_documento, quantidade) VALUES
(5, 1, 3, 8, 10),
(3, 1, 3, 9, 20),
(7, 1, 3, 10, 30),
(9, 1, 3, 11, 70),
(2, 1, 3, 12, 95),
(1, 1, 3, 13, 98),
(4, 1, 3, 14, 17);

-- Inserções de saída de estoque por venda
INSERT INTO venda (nome_cliente, metodo_pagamento) VALUES 
('José da Silva', 'PIX'),
('Pedro Souza', 'Débito'),
('João Pedro', 'Crédito');

INSERT INTO documento (id_entrada_saida, id_venda) VALUES 
(2, 1),
(2, 2),
(2, 3);

INSERT INTO moviestoque (id_item, id_tipo_mov, id_entrada_saida, id_documento, quantidade) VALUES
(5, 2, 2, 11, 5),
(3, 2, 2, 12, 4),
(7, 2, 2, 13, 20);

-- Essas inserções de estoque serão feitas dessa maneira por ser o script inicial com o banco, mas as próximas inserções de estoque serão feitas a partir da procedure criada.