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

