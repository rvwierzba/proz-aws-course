-- Criar banco de dados "loja_livros"
CREATE DATABASE loja_livros;

-- Usar banco de dados "loja_livros"
USE loja_livros;

-- Criar tabela "Livros"
CREATE TABLE Livros (
    livro_id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) NOT NULL,
    autor_id INT NOT NULL,
    editora_id INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    genero VARCHAR(50) NOT NULL,
    data_publicacao DATE NOT NULL,
    CONSTRAINT FK_Livros_Autores FOREIGN KEY (autor_id) REFERENCES Autores(autor_id),
    CONSTRAINT FK_Livros_Editoras FOREIGN KEY (editora_id) REFERENCES Editoras(editora_id)
);

-- Criar tabela "Autores"
CREATE TABLE Autores (
    autor_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL
);

-- Criar tabela "Editoras"
CREATE TABLE Editoras (
    editora_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    pais_sede VARCHAR(50) NOT NULL
);

-- Criar tabela "Vendas"
CREATE TABLE Vendas (
    venda_id INT PRIMARY KEY AUTO_INCREMENT,
    livro_id INT NOT NULL,
    data_venda DATE NOT NULL,
    quantidade INT NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_Vendas_Livros FOREIGN KEY (livro_id) REFERENCES Livros(livro_id)
);

-- Inserir dados na tabela "Livros"
INSERT INTO Livros (titulo, isbn, autor_id, editora_id, preco, genero, data_publicacao)
VALUES
    ('O Senhor dos Anéis', '978-85-95080-32-7', 1, 1, 49.90, 'Fantasia', '1954-07-29'),
    ('O Guia do Mochileiro das Galáxias', '978-85-250-4466-8', 2, 2, 34.90, 'Ficção Científica', '1979-10-04'),
    ('O Hobbit', '978-85-7592-656-7', 1, 1, 29.90, 'Fantasia', '1937-09-21');

-- Inserir dados na tabela "Autores"
INSERT INTO Autores (nome, nacionalidade)
VALUES
    ('J.R.R. Tolkien', 'Reino Unido'),
    ('Douglas Adams', 'Reino Unido');

-- Inserir dados na tabela "Editoras"
INSERT INTO Editoras (nome, pais_sede)
VALUES
    ('Martins Fontes', 'Brasil'),
    ('Intrinseca', 'Brasil');

-- Inserir dados na tabela "Vendas"
INSERT INTO Vendas (livro_id, data_venda, quantidade, valor_total)
VALUES
    (1, '2024-04-23', 1, 49.90),
    (2, '2024-04-22', 2, 69.80);

-- Consultar todos os dados de um livro específico (livro_id = 1)
SELECT livros.*, autores.nome, editoras.nome
FROM Livros
JOIN autores ON livros.autor_id = autores.autor_id
JOIN editoras ON livros.editora_id = editoras.editora_id
WHERE livros.livro_id = 1;

-- Listar todas as vendas de um livro específico (livro_id = 1)
SELECT vendas.*, livros.titulo
FROM vendas
JOIN livros ON vendas.livro_id = livros.livro_id
WHERE livros.livro_id = 1;

-- Calcular o total de vendas de cada livro
SELECT livros.titulo, SUM(vendas.valor_total) AS total_vendas
FROM livros
JOIN vendas ON vendas.livro_id = livros.livro_id
GROUP BY livros.titulo;
