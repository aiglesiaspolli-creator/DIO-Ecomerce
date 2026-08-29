DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce
USE ecommerce;

CREATE TABLE cliente (

    id INT AUTO_INCREMENT,
    primeiro_nome VARCHAR(45) NOT NULL,
    nome_meio VARCHAR(30),
    sobrenome VARCHAR(45) NOT NULL,

    cpf CHAR(11) NOT NULL,

    endereco VARCHAR(150) NOT NULL,

    data_nascimento DATE NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT pk_cliente
        PRIMARY KEY (id),

    CONSTRAINT uk_cliente_cpf
        UNIQUE (cpf)
);


CREATE TABLE pedido (

    id INT AUTO_INCREMENT,

    cliente_id INT NOT NULL,

    status ENUM (
        'Pendente',
        'Processando',
        'Enviado',
        'Entregue',
        'Cancelado'
    ) NOT NULL DEFAULT 'Pendente',

    descricao VARCHAR(200),

    frete DECIMAL(10,2) NOT NULL DEFAULT 0.00,

    data_pedido DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT pk_pedido
        PRIMARY KEY (id),

    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (cliente_id)
        REFERENCES cliente(id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT ck_pedido_frete
        CHECK (frete >= 0)
);


CREATE TABLE produto (

    id INT AUTO_INCREMENT,

    categoria VARCHAR(45) NOT NULL,

    descricao VARCHAR(150) NOT NULL,

    marca VARCHAR(45),

    valor DECIMAL(10,2) NOT NULL,

    peso DECIMAL(8,2),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT pk_produto
        PRIMARY KEY (id),

    CONSTRAINT ck_produto_valor
        CHECK (valor >= 0),

    CONSTRAINT ck_produto_peso
        CHECK (peso >= 0)
);


CREATE TABLE fornecedor (

    id INT AUTO_INCREMENT,

    razao_social VARCHAR(100) NOT NULL,

    cnpj CHAR(14) NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT pk_fornecedor
        PRIMARY KEY (id),

    CONSTRAINT uk_fornecedor_cnpj
        UNIQUE (cnpj)
);


CREATE TABLE estoque (

    id INT AUTO_INCREMENT,

    local VARCHAR(80) NOT NULL,

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT pk_estoque
        PRIMARY KEY (id)
);


CREATE TABLE terceiro_vendedor (

    id INT AUTO_INCREMENT,

    razao_social VARCHAR(100) NOT NULL,

    nome_fantasia VARCHAR(100),

    local VARCHAR(80),

    endereco VARCHAR(150),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    CONSTRAINT pk_terceiro_vendedor
        PRIMARY KEY (id),

    CONSTRAINT uk_terceiro_vendedor_razao_social
        UNIQUE (razao_social)

);