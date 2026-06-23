
-- ==================================
-- SISTEMA DE CADASTRO SIMPLES
-- ==================================

-- Criar banco de dados
CREATE DATABASE cadastro_db;

-- Usar banco
USE cadastro_db;

-- Criar tabela
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ======================
-- CADASTRAR USUÁRIOS
-- ======================

INSERT INTO usuarios (nome, email, telefone)
VALUES
('João Silva', 'joao@email.com', '11999999999');

INSERT INTO usuarios (nome, email, telefone)
VALUES
('Maria Souza', 'maria@email.com', '11888888888');

-- ======================
-- LISTAR USUÁRIOS
-- ======================

SELECT * FROM usuarios;

-- ======================
-- BUSCAR USUÁRIO
-- ======================

SELECT *
FROM usuarios
WHERE nome LIKE '%João%';

-- ======================
-- ATUALIZAR USUÁRIO
-- ======================

UPDATE usuarios
SET telefone = '11777777777'
WHERE id = 1;

-- ======================
-- EXCLUIR USUÁRIO
-- ======================

DELETE FROM usuarios
WHERE id = 2;

-- ======================
-- CONSULTA FINAL
-- ======================

SELECT * FROM usuarios;