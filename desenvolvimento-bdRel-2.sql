-- Criar banco de dados "estoque"
CREATE DATABASE estoque;

-- Usar banco de dados "estoque"
USE estoque;

-- Criar tabela "Produtos"
CREATE TABLE Produtos (
    produto_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(500) NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    unidade_medida VARCHAR(50) NOT NULL
);

-- Criar tabela "Fornecedores"
CREATE TABLE Fornecedores (
    fornecedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Criar tabela "EntradasEstoque"
CREATE TABLE EntradasEstoque (
    entrada_id INT PRIMARY KEY AUTO_INCREMENT,
    produto_id INT NOT NULL,
    fornecedor_id INT NOT NULL,
    data_entrada DATE NOT NULL,
    quantidade INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_EntradasEstoque_Produtos FOREIGN KEY (produto_id) REFERENCES Produtos(produto_id),
    CONSTRAINT FK_EntradasEstoque_Fornecedores FOREIGN KEY (fornecedor_id) REFERENCES Fornecedores(fornecedor_id)
);

-- Trigger para atualizar quantidade em estoque após nova entrada
CREATE TRIGGER trg_AtualizarEstoque AFTER INSERT ON EntradasEstoque
FOR EACH ROW
BEGIN
    UPDATE Produtos
    SET quantidade_estoque = quantidade_estoque + NEW.quantidade
    WHERE produto_id = NEW.produto_id;
END;

-- Inserir dados na tabela "Produtos"
INSERT INTO Produtos (nome, descricao, preco_unitario, unidade_medida)
VALUES
    ('Camiseta', 'Camiseta branca de algodão', 19.90, 'unidade'),
    ('Teclado', 'Teclado mecânico gamer', 249.90, 'unidade'),
    ('Caneta', 'Caneta esferográfica azul', 2.50, 'unidade');

-- Inserir dados na tabela "Fornecedores"
INSERT INTO Fornecedores (nome, cnpj, email)
VALUES
    ('Fornecedor A', '12
