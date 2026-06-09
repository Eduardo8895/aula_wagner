-- =====================================
-- BANCO DE DADOS DO SISTEMA
-- Cria o banco e seleciona ele para uso
-- =====================================

DROP DATABASE IF EXISTS sistema_acesso;
CREATE DATABASE sistema_acesso;
USE sistema_acesso;

-- =====================================
-- TABELA USUARIO
-- Guarda os usuários do sistema
-- =====================================

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =====================================
-- TABELA GRUPO
-- Guarda os grupos de acesso
-- Ex: Administrador, Vendedor
-- =====================================

CREATE TABLE grupo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

-- =====================================
-- TABELA PAPEL
-- Guarda as permissões do sistema
-- Ex: cadastrar, ver relatórios
-- =====================================

CREATE TABLE papel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

-- =====================================
-- USUARIO_GRUPO
-- Liga usuário com grupo (N:N)
-- Um usuário pode ter vários grupos
-- =====================================

CREATE TABLE usuario_grupo (
    usuario_id INT,
    grupo_id INT
);

-- =====================================
-- GRUPO_PAPEL
-- Liga grupo com permissões (N:N)
-- Um grupo pode ter vários papéis
-- =====================================

CREATE TABLE grupo_papel (
    grupo_id INT,
    papel_id INT
);

-- =====================================
-- LOG_LOGIN
-- Registra acessos dos usuários
-- Guarda data, IP e status
-- =====================================

CREATE TABLE log_login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    data_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ip VARCHAR(50),
    status VARCHAR(20)
);

-- =====================================
-- DADOS DE TESTE
-- Inserção de usuários, grupos e papéis
-- =====================================

INSERT INTO usuario (nome, email)
VALUES
('Joao', 'joao@email.com'),
('Maria', 'maria@email.com'),
('Felipe', 'felipe@email.com');

INSERT INTO grupo (nome)
VALUES
('Administrador'),
('Vendedor'),
('Programador');

INSERT INTO papel (nome)
VALUES
('Cadastrar Usuario'),
('Relatorio Acesso'),
('Configurar Sistema');

-- Relaciona usuários com grupos
INSERT INTO usuario_grupo (usuario_id, grupo_id)
VALUES
(1,1),
(2,2),
(3,3);

-- Relaciona grupos com papéis
INSERT INTO grupo_papel (grupo_id, papel_id)
VALUES
(1,1),
(1,2),
(1,3),
(2,2),
(3,1),
(3,2);

-- Logs de login dos usuários
INSERT INTO log_login (usuario_id, ip, status)
VALUES
(1,'192.168.1.1','Sucesso'),
(2,'192.168.1.2','Falha'),
(3,'192.168.1.3','Sucesso'),
(1,'192.168.1.4','Sucesso');

-- =====================================
-- CONSULTA 1
-- Usuários e seus grupos
-- =====================================

SELECT u.nome, g.nome AS grupo
FROM usuario u
JOIN usuario_grupo ug ON u.id = ug.usuario_id
JOIN grupo g ON g.id = ug.grupo_id;

-- =====================================
-- CONSULTA 2
-- Papéis de um usuário específico
-- =====================================

SELECT u.nome, p.nome AS papel
FROM usuario u
JOIN usuario_grupo ug ON u.id = ug.usuario_id
JOIN grupo_papel gp ON ug.grupo_id = gp.grupo_id
JOIN papel p ON p.id = gp.papel_id
WHERE u.id = 1;

-- =====================================
-- CONSULTA 3
-- Últimos 5 acessos
-- =====================================

SELECT u.nome, l.data_login, l.ip, l.status
FROM log_login l
JOIN usuario u ON u.id = l.usuario_id
ORDER BY l.data_login DESC
LIMIT 5;

-- =====================================
-- CONSULTA EXTRA (7 DIAS)
-- Usuários que acessaram recentemente
-- =====================================

SELECT u.nome, l.data_login
FROM log_login l
JOIN usuario u ON u.id = l.usuario_id
WHERE l.data_login >= NOW() - INTERVAL 7 DAY;