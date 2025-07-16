-- ===============================
-- SCRIPT 1: Criar banco e tabelas
-- ===============================

-- Criar o banco de dados

CREATE DATABASE dispesa_viagens;
\c dispesa_viagens
set datestyle to 'ISO,DMY';

-- Tabela Funcionario
CREATE TABLE Funcionario (
    FuncionarioID     VARCHAR(7) PRIMARY KEY,
    CPF               VARCHAR(11),
    Nome              VARCHAR(40),
    Sobrenome         VARCHAR(40),
    DataDeNascimento  DATE,
    Email             VARCHAR(40),
    Senha             VARCHAR(40),
    Telefone          VARCHAR(15),
    Endereco          VARCHAR(60),
    CEP               VARCHAR(8),
    CaminhoFoto       VARCHAR(255)
);

-- Tabela Despesa
CREATE TABLE Despesa (
    DespesaID         VARCHAR(7) PRIMARY KEY,
    TipoDespesa       VARCHAR(40),
    Descricao         VARCHAR(40),
    ValorPago         VARCHAR(40),
    CidadeNotaFiscal  VARCHAR(40),
    DataNotaFiscal    DATE,
    CaminhoImagem     VARCHAR(255),
    ViagemID          VARCHAR(40)
);

-- Tabela Viagem
CREATE TABLE Viagem (
    ViagemID      VARCHAR(7) PRIMARY KEY,
    DataIda       DATE,
    DataVolta     DATE,
    Objetivo      VARCHAR(500),
    Descricao     VARCHAR(500),
    Destino       VARCHAR(40),
    FuncionarioID VARCHAR(7),
    DespesaID     VARCHAR(7),
    FOREIGN KEY (FuncionarioID) REFERENCES Funcionario(FuncionarioID),
    FOREIGN KEY (DespesaID) REFERENCES Despesa(DespesaID)
);

-- Tabela Tipo
CREATE TABLE Tipo (
    TipoID      VARCHAR(7) PRIMARY KEY,
    Vestuario   VARCHAR(40),
    Cosmetico   VARCHAR(40)
);

-- Tabela Produto
CREATE TABLE Produto (
    ProdutoCodigo  VARCHAR(7) PRIMARY KEY,
    NomeProduto    VARCHAR(40),
    Quantidade     VARCHAR(40),
    MarcaProduto   VARCHAR(40),
    DataCompra     DATE,
    Preco          VARCHAR(40),
    LugarComprar   VARCHAR(40),
    TipoID         VARCHAR(7),
    FOREIGN KEY (TipoID) REFERENCES Tipo(TipoID)
);

-- Tabela Compra
CREATE TABLE Compra (
    CompraCodigo   VARCHAR(7) PRIMARY KEY,
    Descricao      VARCHAR(500),
    Local          VARCHAR(40),
    Comissao       VARCHAR(7),
    DataCompra     DATE,
    ViagemID       VARCHAR(7),
    ProdutoCodigo  VARCHAR(7),
    FOREIGN KEY (ViagemID) REFERENCES Viagem(ViagemID),
    FOREIGN KEY (ProdutoCodigo) REFERENCES Produto(ProdutoCodigo)
);

-- ===============================
-- SCRIPT 2: Inserir dados (10 tuplas com tabelas principais  e 12 tuplas com a tabela viagem)
-- ===============================

-- Inserir Funcionarios
INSERT INTO Funcionario VALUES
('F001','69935490029','jean','leite','1990-01-15','func1@empresa.com','senha123','(49)994330466','Rua Exemplo 1','89800183','/imagens/func1.jpg'),
('F002','11440051734','jackes','jair','1991-02-15','func2@empresa.com','senha123','(49)990319060','Rua Exemplo 2','89800347','/imagens/func2.jpg'),
('F003','47291360077','ana','nunes','1992-03-15','func3@empresa.com','senha123','(49)990827426','Rua Exemplo 3','89800269','/imagens/func3.jpg'),
('F004','63976426868','carol','pierre','1993-04-15','func4@empresa.com','senha123','(49)992789785','Rua Exemplo 4','89800680','/imagens/func4.jpg'),
('F005','69026203560','joseph','gutemberd','1994-05-15','func5@empresa.com','senha123','(49)998347342','Rua Exemplo 5','89800835','/imagens/func5.jpg'),
('F006','47615553620','arthur','point','1995-06-15','func6@empresa.com','senha123','(49)997324198','Rua Exemplo 6','89800958','/imagens/func6.jpg'),
('F007','61671991506','max','da silva','1996-07-15','func7@empresa.com','senha123','(49)997789227','Rua Exemplo 7','89800657','/imagens/func7.jpg'),
('F008','61094425492','stefane','dos santos','1997-08-15','func8@empresa.com','senha123','(49)992537829','Rua Exemplo 8','89800376','/imagens/func8.jpg'),
('F009','81219479051','jenny','dorvilma','1998-09-15','func9@empresa.com','senha123','(49)996189998','Rua Exemplo 9','89800595','/imagens/func9.jpg'),
('F010','91113548250','sara','Dore','1999-10-15','func10@empresa.com','senha123','(49)996041682','Rua Exemplo 10','89800895','/imagens/func10.jpg');

-- Inserir Tipos
INSERT INTO Tipo VALUES
('T01','Camisa','Shampoo'),
('T02','Calça','Sabonete'),
('T03','Casaco','Hidratante'),
('T04','Tênis','Condicionador'),
('T05','Vestido','Perfume'),
('T06','Short','Creme'),
('T07','Blusa','Sabonete Líquido'),
('T08','Jaqueta','Gel Capilar'),
('T09','Meia','Desodorante'),
('T10','Cinto','Protetor Solar');

-- Inserir Despesas
INSERT INTO Despesa VALUES
('D001','Transporte','Taxi aeroporto','120.50','Chapecó','2024-01-10','/img/d1.jpg','V001'),
('D002','Alimentação','Jantar executivo','85.90','Florianópolis','2024-01-12','/img/d2.jpg','V002'),
('D003','Hospedagem','Hotel 3 estrelas','320.00','Porto Alegre','2024-01-15','/img/d3.jpg','V003'),
('D004','Aluguel carro','Locadora ABC','240.00','Blumenau','2024-01-18','/img/d4.jpg','V004'),
('D005','Estacionamento','Centro','20.00','Curitiba','2024-01-20','/img/d5.jpg','V005'),
('D006','Alimentação','Almoço com cliente','90.00','São Paulo','2024-01-23','/img/d6.jpg','V006'),
('D007','Hospedagem','Hotel Executivo','350.00','Joinville','2024-01-25','/img/d7.jpg','V007'),
('D008','Transporte','Uber','35.00','Rio de Janeiro','2024-01-28','/img/d8.jpg','V008'),
('D009','Outros','Material escritório','45.00','Lages','2024-02-01','/img/d9.jpg','V009'),
('D010','Alimentação','Refeição noturna','60.00','Criciúma','2024-02-05','/img/d10.jpg','V010');

-- Inserir Viagens
INSERT INTO Viagem VALUES
('V001','2024-01-10','2024-01-12','Feira de negócios','Participação em evento internacional','São Paulo','F001','D001'),
('V002','2024-01-12','2024-01-14','Reunião estratégica','Visita a parceiros comerciais','Florianópolis','F002','D002'),
('V003','2024-01-15','2024-01-17','Treinamento','Capacitação de equipe','Porto Alegre','F003','D003'),
('V004','2024-01-18','2024-01-19','Evento de tecnologia','Workshop sobre IA','Blumenau','F004','D004'),
('V005','2024-01-20','2024-01-21','Pesquisa de mercado','Avaliação de produtos','Curitiba','F005','D005'),
('V006','2024-01-23','2024-01-25','Negociação','Reunião com investidores','São Paulo','F006','D006'),
('V007','2024-01-25','2024-01-27','Conferência','Participação em palestras','Joinville','F007','D007'),
('V008','2024-01-28','2024-01-30','Visita técnica','Análise de produção','Rio de Janeiro','F008','D008'),
('V009','2024-02-01','2024-02-03','Planejamento','Revisão de metas','Lages','F009','D009'),
('V010','2024-02-05','2024-02-07','Inspeção','Controle de qualidade','Criciúma','F010','D010'),
('V011','2024-02-10','2024-02-12','Treinamento interno','Curso sobre PostgreSQL','Chapecó','F001','D001'),
('V012','2024-02-13','2024-02-15','Evento de inovação','Participação em feira','Florianópolis','F003','D003');


-- Inserir Produtos
INSERT INTO Produto VALUES
('P001','Camisa Polo','10','Marca A','2024-01-10','89.90','Loja A','T01'),
('P002','Calça Jeans','15','Marca B','2024-01-12','119.90','Loja B','T02'),
('P003','Casaco Inverno','5','Marca C','2024-01-15','249.90','Loja C','T03'),
('P004','Tênis Corrida','8','Marca D','2024-01-18','199.90','Loja D','T04'),
('P005','Vestido Floral','12','Marca E','2024-01-20','149.90','Loja E','T05'),
('P006','Short Esportivo','20','Marca F','2024-01-23','69.90','Loja F','T06'),
('P007','Blusa Manga Longa','14','Marca G','2024-01-25','99.90','Loja G','T07'),
('P008','Jaqueta Corta-Vento','7','Marca H','2024-01-28','179.90','Loja H','T08'),
('P009','Meia Algodão','30','Marca I','2024-02-01','19.90','Loja I','T09'),
('P010','Cinto Couro','9','Marca J','2024-02-05','59.90','Loja J','T10');

-- Inserir Compras
INSERT INTO Compra VALUES
('C001','Compra de uniforme','Loja A','10','2024-01-10','V001','P001'),
('C002','Aquisição de calças','Loja B','12','2024-01-12','V002','P002'),
('C003','Casacos para equipe','Loja C','15','2024-01-15','V003','P003'),
('C004','Tênis para funcionários','Loja D','8','2024-01-18','V004','P004'),
('C005','Vestidos promocionais','Loja E','9','2024-01-20','V005','P005'),
('C006','Shorts de verão','Loja F','11','2024-01-23','V006','P006'),
('C007','Blusas para eventos','Loja G','7','2024-01-25','V007','P007'),
('C008','Jaquetas corporativas','Loja H','10','2024-01-28','V008','P008'),
('C009','Meias técnicas','Loja I','5','2024-02-01','V009','P009'),
('C010','Cintos para uniforme','Loja J','6','2024-02-05','V010','P010');
