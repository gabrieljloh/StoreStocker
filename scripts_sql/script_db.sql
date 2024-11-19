-- Tabela: status
CREATE TABLE status (
    id_status SERIAL PRIMARY KEY,
    status_nome VARCHAR(15) NOT NULL CONSTRAINT CHK_StatusNome CHECK (status_nome IN ('ativo', 'desativado'))
);

-- Tabela: categoria
CREATE TABLE categoria (
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(20) NOT NULL
);

-- Tabela: item
CREATE TABLE item (
    id_item SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(300) NOT NULL,
    preco NUMERIC(8,2) NOT NULL,
    material VARCHAR(15),
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_categoria INT NOT NULL REFERENCES categoria(id_categoria),
    id_status INT NOT NULL REFERENCES status(id_status)
);

-- Tabela: tipomov
CREATE TABLE tipomov (
    id_tipo_mov SERIAL PRIMARY KEY,
    tipo_nome VARCHAR(10) NOT NULL CONSTRAINT CHK_TipoMov CHECK (tipo_nome IN ('entrada', 'saida'))
);

-- Tabela: entradasaida
CREATE TABLE entradasaida (
    id_entrada_saida SERIAL PRIMARY KEY,
    entrada_saida_nome VARCHAR(50) NOT NULL CONSTRAINT CHK_TipoSaiEnt CHECK (entrada_saida_nome IN ('balanco', 'venda', 'nota_fiscal'))
);

-- Tabela: venda
CREATE TABLE venda (
    id_venda SERIAL PRIMARY KEY,
    nome_cliente VARCHAR(100) NOT NULL,
    metodo_pagamento VARCHAR(30) NOT NULL,
);

-- Tabela: documento
CREATE TABLE documento (
    id_documento SERIAL PRIMARY KEY,
    id_entrada_saida INT NOT NULL REFERENCES entradasaida(id_entrada_saida),
    motivo_balanco VARCHAR(200),
    numero_nota INT,
    id_venda INT REFERENCES venda(id_venda)
);

-- Tabela: moviestoque
CREATE TABLE moviestoque (
    id_movimentacao SERIAL PRIMARY KEY,
    id_item INT NOT NULL REFERENCES item(id_item),
    id_tipo_mov INT NOT NULL REFERENCES tipomov(id_tipo_mov),
    id_entrada_saida INT NOT NULL REFERENCES entradasaida(id_entrada_saida),
    id_documento INT NOT NULL REFERENCES documento(id_documento),
    quantidade INT NOT NULL,
    data_movi TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela: saldoestoque
CREATE TABLE saldoestoque (
    id_saldo_estoque SERIAL PRIMARY KEY,
    id_item INT NOT NULL REFERENCES item(id_item),
    quantidade INT NOT NULL DEFAULT 0
);


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
('Relógio Clássico', 'Relógio com design clássico e pulseira de aço.', 350.00, 'Aço', 5, 1);


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