CREATE TABLE funcionarios (
ID INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
departamento VARCHAR(50),
salario DECIMAL(10,2)
);
INSERT INTO funcionarios (nome, departamento, salario)
VALUES ('Ana Silva', 'Financeiro', 5000);

INSERT INTO funcionarios (nome, departamento, salario)
VALUES ('Carlos Souza', 'RH', 4500);

INSERT INTO funcionarios (nome, departamento, salario)
VALUES ('Mariana Lima', 'TI', 6000);
SELECT * FROM funcionarios;
CREATE TABLE log_transacoes (
ID INT AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(255),
data_movimentacao DATETIME
);
START TRANSACTION;

UPDATE funcionarios
SET departamento = 'Financeiro'
WHERE nome = 'Carlos Souza';
INSERT INTO log_transacoes (descricao, data_movimentacao)
VALUES ('Carlos Souza transferido para o departamento Financeiro', NOW());
COMMIT;
SELECT * FROM funcionarios;
SELECT * FROM log_transacoes;
START TRANSACTION;

UPDATE funcionarios
SET salario = salario + 500
WHERE nome = 'Ana Silva';

COMMIT;
START TRANSACTION;

UPDATE funcionarios
SET salario = salario + 200
WHERE nome = 'Ana Silva';

SAVEPOINT ponto1;

UPDATE funcionarios
SET salario = salario + 300
WHERE nome = 'Ana Silva';

ROLLBACK TO ponto1;

COMMIT;