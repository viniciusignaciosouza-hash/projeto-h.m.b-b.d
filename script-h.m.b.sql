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

