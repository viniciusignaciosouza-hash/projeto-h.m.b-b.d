CREATE TABLE clientes (
    id_cliente BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    cpf VARCHAR(14) UNIQUE NOT NULL
);

INSERT INTO clientes (nome, email, telefone, cpf) VALUES
('Ana Silva', 'ana.silva@email.com', '(11) 98765-4321', '123.456.789-01'),
('Bruno Souza', 'bruno.souza@email.com', '(21) 91234-5678', '234.567.890-12'),
('Carlos Lima', 'carlos.lima@email.com', '(31) 99887-7665', '345.678.901-23'),
('Diana Costa', 'diana.costa@email.com', '(41) 97766-5544', '456.789.012-34'),
('Eduardo Santos', 'eduardo.santos@email.com', '(51) 96655-4433', '567.890.123-45');
CREATE TABLE endereco (
    id_endereco BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    id_cliente BIGINT NOT NULL,

    CONSTRAINT fk_endereco_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO endereco (logradouro, numero, cidade, estado, cep, id_cliente) VALUES
('Rua das Flores', '123', 'São Paulo', 'SP', '01001-000', 1),
('Avenida Brasil', '456', 'Rio de Janeiro', 'RJ', '20040-000', 2),
('Rua da Bahia', '789', 'Belo Horizonte', 'MG', '30160-010', 3),
('Avenida das Torres', '1011', 'Curitiba', 'PR', '80010-020', 4),
('Rua dos Pampas', '52', 'Porto Alegre', 'RS', '90010-150', 5);
CREATE TABLE endereco (
    id_endereco BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    logradouro VARCHAR(255) NOT NULL,
    numero VARCHAR(20) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    estado VARCHAR(2) NOT NULL,
    cep VARCHAR(9) NOT NULL,
    id_cliente BIGINT NOT NULL,

    CONSTRAINT fk_endereco_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO endereco (logradouro, numero, cidade, estado, cep, id_cliente) VALUES
('Rua das Flores', '123', 'São Paulo', 'SP', '01001-000', 1),
('Avenida Brasil', '456', 'Rio de Janeiro', 'RJ', '20040-000', 2),
('Rua da Bahia', '789', 'Belo Horizonte', 'MG', '30160-010', 3),
('Avenida das Torres', '1011', 'Curitiba', 'PR', '80010-020', 4),
('Rua dos Pampas', '52', 'Porto Alegre', 'RS', '90010-150', 5);
CREATE TABLE fornecedor (
    id_fornecedor BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    contato VARCHAR(255)
);

INSERT INTO fornecedor (nome, cnpj, contato) VALUES
('Tech Distribuidora Ltda', '12.345.678/0001-90', 'contato@techdistribuidora.com'),
('Editora Saber S.A.', '23.456.789/0001-01', 'vendas@editorasaber.com'),
('Moda Estilo Comércio', '34.567.890/0001-12', 'suporte@modaestilo.com'),
('Alimentos Saudáveis do Brasil', '45.678.901/0001-23', 'comercial@alimentosbrasil.com'),
('DecorLar Utilidades', '56.789.012/0001-34', 'atendimento@decorlar.com');

CREATE TABLE produto (
    id_produto BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    marca VARCHAR(255) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    nota_avaliacao DECIMAL(10, 2) NOT NULL,
    id_categoria BIGINT NOT NULL,
    id_fornecedor BIGINT NOT NULL,

    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria),
    CONSTRAINT fk_produto_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

INSERT INTO produto (nome, marca, preco, nota_avaliacao, id_categoria, id_fornecedor) VALUES
('Smartphone X', 'TechBrand', 2500.00, 4.80, 1, 1),
('Livro de SQL Avançado', 'Editora Saber', 120.00, 4.90, 2, 2),
('Camiseta Básica Algodão', 'EstiloPro', 49.90, 4.50, 3, 3),
('Café Orgânico 500g', 'Sabor Puro', 28.50, 4.70, 4, 4),
('Abajur de Mesa Minimalista', 'DecorLar', 150.00, 4.30, 5, 5);
CREATE TABLE estoque (
    id_estoque BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    quantidade INT,
    id_produto BIGINT NOT NULL,

    CONSTRAINT fk_estoque_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

INSERT INTO estoque (quantidade, id_produto) VALUES
(50, 1),
(120, 2),
(200, 3),
(80, 4),
(35, 5);
CREATE TABLE carrinho (
    id_carrinho BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    id_cliente BIGINT NOT NULL,
    id_produto BIGINT NOT NULL,

    CONSTRAINT fk_carrinho_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_carrinho_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);

INSERT INTO carrinho (quantidade, preco_unitario, id_cliente, id_produto) VALUES
(1, 2500.00, 1, 1),
(2, 120.00, 2, 2),
(3, 49.90, 3, 3),
(1, 28.50, 4, 4),
(1, 150.00, 5, 5);

CREATE TABLE compra (
    id_compra BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    data_compra TIMESTAMP,
    valor_total DECIMAL(10, 2) NOT NULL,
    id_cliente BIGINT NOT NULL,
    id_endereco BIGINT NOT NULL,

    CONSTRAINT fk_compra_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_compra_endereco FOREIGN KEY (id_endereco) REFERENCES endereco(id_endereco)
);

INSERT INTO compra (data_compra, valor_total, id_cliente, id_endereco) VALUES
('2026-06-01 10:30:00', 2500.00, 1, 1),
('2026-06-02 14:15:00', 240.00, 2, 2),
('2026-06-03 09:00:00', 149.70, 3, 3),
('2026-06-04 16:45:00', 28.50, 4, 4),
('2026-06-05 11:20:00', 150.00, 5, 5);

