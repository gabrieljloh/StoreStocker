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
    metodo_pagamento VARCHAR(30) NOT NULL
);

-- Tabela: documento
CREATE TABLE documento (
    id_documento SERIAL PRIMARY KEY,
    id_entrada_saida INT NOT NULL REFERENCES entradasaida(id_entrada_saida),
    motivo_balanco VARCHAR(200),
    numero_nota numeric(6,0),
    id_venda INT REFERENCES venda(id_venda)
);

-- Tabela: moviestoque
CREATE TABLE moviestoque (
    id_movimentacao SERIAL PRIMARY KEY,
    id_item INT NOT NULL REFERENCES item(id_item),
    id_tipo_mov INT NOT NULL REFERENCES tipomov(id_tipo_mov),
    id_entrada_saida INT NOT NULL REFERENCES entradasaida(id_entrada_saida),
    id_documento INT NOT NULL REFERENCES documento(id_documento),
    quantidade NUMERIC(5,0) NOT NULL,
    data_movi TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela: saldoestoque
CREATE TABLE saldoestoque (
    id_saldo_estoque SERIAL PRIMARY KEY,
    id_item INT NOT NULL REFERENCES item(id_item),
    quantidade numeric(5,0) NOT NULL DEFAULT 0
);