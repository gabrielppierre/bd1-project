CREATE DATABASE IF NOT EXISTS maracatu;
USE maracatu;

-- criação das tabelas base (sem dependencias externas)
CREATE TABLE Pessoa (
    id_pessoa INT PRIMARY KEY AUTO_INCREMENT,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Barraca (
    id_barraca INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE Maquina (
    id_maquina INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE Recurso (
    id_recurso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE Produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL CHECK (preco > 0)
);

CREATE TABLE Local (
    id_local INT PRIMARY KEY AUTO_INCREMENT,
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(100),
    bairro VARCHAR(50) NOT NULL
);

CREATE TABLE Evento (
    id_evento INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE Grupo_Maracatu (
    id_grupo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    ano_fundacao INT NOT NULL,
    cidade_origem VARCHAR(50) NOT NULL,
    historico TEXT
);

CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao ENUM(
        'Artístico',
        'Logística',
        'Financeiro',
        'Marketing',
        'Produção',
        'Jurídico',
        'Recursos Humanos',
        'Infraestrutura'
    ) NOT NULL UNIQUE
);

-- tabelas de especialização de Pessoa
CREATE TABLE Pessoa_Fisica (
    id_pessoa INT PRIMARY KEY,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    nome VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa) ON DELETE CASCADE
);

CREATE TABLE Pessoa_Juridica (
    id_pessoa INT PRIMARY KEY,
    cnpj VARCHAR(18) NOT NULL UNIQUE,
    razao_social VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa(id_pessoa) ON DELETE CASCADE
);

CREATE TABLE Espaco (
    id_espaco INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    coordenadas_y FLOAT NOT NULL,
    coordenadas_x FLOAT NOT NULL
);

-- especializações de Pessoa_Fisica
CREATE TABLE Tecnico (
    id_pessoa INT PRIMARY KEY,
    especializacao VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa_Fisica(id_pessoa) ON DELETE CASCADE
);

CREATE TABLE Func_Organizador (
    id_pessoa INT PRIMARY KEY,
    funcao VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa_Fisica(id_pessoa) ON DELETE CASCADE
);

CREATE TABLE Jurado (
    id_pessoa INT PRIMARY KEY,
    area_especializacao VARCHAR(100) NOT NULL,
    instituicao VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa_Fisica(id_pessoa) ON DELETE CASCADE
);

CREATE TABLE Integrante_Maracatu (
    id_pessoa INT PRIMARY KEY,
    funcao VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa_Fisica(id_pessoa) ON DELETE CASCADE
);

-- especializaçoes de Pessoa_Juridica
CREATE TABLE Vendedor (
    id_pessoa INT PRIMARY KEY,
    inscricao_municipal VARCHAR(20) NOT NULL UNIQUE,
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa_Juridica(id_pessoa) ON DELETE CASCADE
);

CREATE TABLE Patrocinador (
    id_pessoa INT PRIMARY KEY,
    contrapartida_esperada VARCHAR(200),
    FOREIGN KEY (id_pessoa) REFERENCES Pessoa_Juridica(id_pessoa) ON DELETE CASCADE
);

-- tabelas de relacionamentos
CREATE TABLE Apresenta (
    id_evento INT,
    id_grupo INT,
    ordem_apresentacao INT NOT NULL,
    duracao FLOAT NOT NULL CHECK (duracao > 0),
    PRIMARY KEY (id_evento, id_grupo, ordem_apresentacao),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento) ON DELETE CASCADE,
    FOREIGN KEY (id_grupo) REFERENCES Grupo_Maracatu(id_grupo) ON DELETE CASCADE,
    UNIQUE (id_evento, ordem_apresentacao)  -- garantir que as apresentações dos grupos n se sobreponham 
);

CREATE TABLE Avalia (
    id_evento INT,
    id_grupo INT,
    ordem_apresentacao INT,
    id_jurado INT,
    nota FLOAT NOT NULL CHECK (nota >= 0 AND nota <= 10),
    PRIMARY KEY (id_evento, id_grupo, ordem_apresentacao, id_jurado),
    FOREIGN KEY (id_evento, id_grupo, ordem_apresentacao) 
        REFERENCES Apresenta(id_evento, id_grupo, ordem_apresentacao) ON DELETE CASCADE,
    FOREIGN KEY (id_jurado) REFERENCES Jurado(id_pessoa) ON DELETE CASCADE
);

CREATE TABLE Gerencia (
    id_vendedor INT,
    id_barraca INT,
    PRIMARY KEY (id_vendedor, id_barraca),
    FOREIGN KEY (id_vendedor) REFERENCES Vendedor(id_pessoa) ON DELETE CASCADE,
    FOREIGN KEY (id_barraca) REFERENCES Barraca(id_barraca) ON DELETE CASCADE
);

CREATE TABLE Movimenta (
    id_barraca INT,
    id_produto INT,
    data_hora DATETIME NOT NULL,
    tipo VARCHAR(20) NOT NULL CHECK (tipo IN ('venda', 'abastecimento')),
    quantidade INT NOT NULL CHECK (quantidade > 0),
    PRIMARY KEY (id_barraca, id_produto, data_hora),
    FOREIGN KEY (id_barraca) REFERENCES Barraca(id_barraca) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto) ON DELETE CASCADE
);

CREATE TABLE Tem (
    id_local INT,
    id_espaco INT,
    PRIMARY KEY (id_local, id_espaco),
    FOREIGN KEY (id_local) REFERENCES Local(id_local) ON DELETE CASCADE,
    FOREIGN KEY (id_espaco) REFERENCES Espaco(id_espaco) ON DELETE CASCADE
);

CREATE TABLE Aloca (
    id_barraca INT PRIMARY KEY,
    id_espaco INT NOT NULL UNIQUE,
    FOREIGN KEY (id_barraca) REFERENCES Barraca(id_barraca) ON DELETE CASCADE,
    FOREIGN KEY (id_espaco) REFERENCES Espaco(id_espaco) ON DELETE CASCADE
);

CREATE TABLE Patrocina (
    id_patrocinador INT,
    id_evento INT,
    valor_patrocinio DECIMAL(10, 2) NOT NULL CHECK (valor_patrocinio > 0),
    tipo VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_patrocinador, id_evento),
    FOREIGN KEY (id_patrocinador) REFERENCES Patrocinador(id_pessoa) ON DELETE CASCADE,
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento) ON DELETE CASCADE
);

CREATE TABLE Reserva (
    id_evento INT PRIMARY KEY,
    id_local INT NOT NULL,
    data DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_final TIME NOT NULL,
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento) ON DELETE CASCADE,
    FOREIGN KEY (id_local) REFERENCES Local(id_local) ON DELETE CASCADE,
    CHECK (hora_final > hora_inicio),
    UNIQUE (id_local, data, hora_inicio, hora_final)  -- evitar sobreposiçao dos eventos no mesmo local
);

CREATE TABLE Organiza (
    id_func_org INT,
    id_evento INT,
    PRIMARY KEY (id_func_org, id_evento),
    FOREIGN KEY (id_func_org) REFERENCES Func_Organizador(id_pessoa) ON DELETE CASCADE,
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento) ON DELETE CASCADE
);

CREATE TABLE Trabalha_Para (
    id_pessoa INT,
    id_departamento INT,
    data_inicio DATE NOT NULL,
    eh_supervisor BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (id_pessoa, id_departamento),
    FOREIGN KEY (id_pessoa) REFERENCES Func_Organizador(id_pessoa) ON DELETE CASCADE,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento) ON DELETE CASCADE
);

CREATE TABLE Participa (
    id_integrante INT,
    id_grupo INT,
    eh_lider BOOLEAN NOT NULL DEFAULT FALSE,
    data_inicio DATE NOT NULL,
    PRIMARY KEY (id_integrante, id_grupo),
    FOREIGN KEY (id_integrante) REFERENCES Integrante_Maracatu(id_pessoa) ON DELETE CASCADE,
    FOREIGN KEY (id_grupo) REFERENCES Grupo_Maracatu(id_grupo) ON DELETE CASCADE
);

CREATE TABLE Opera (
    id_maquina INT,
    id_tecnico INT,
    id_evento INT,
    PRIMARY KEY (id_maquina, id_tecnico, id_evento),
    FOREIGN KEY (id_maquina) REFERENCES Maquina(id_maquina) ON DELETE CASCADE,
    FOREIGN KEY (id_tecnico) REFERENCES Tecnico(id_pessoa) ON DELETE CASCADE,
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento) ON DELETE CASCADE
);

CREATE TABLE Reserva_Infra (
    id_evento INT,
    id_recurso INT,
    id_func_org INT NOT NULL,
    PRIMARY KEY (id_evento, id_recurso),
    FOREIGN KEY (id_evento) REFERENCES Evento(id_evento) ON DELETE CASCADE,
    FOREIGN KEY (id_recurso) REFERENCES Recurso(id_recurso) ON DELETE CASCADE,
    FOREIGN KEY (id_func_org) REFERENCES Func_Organizador(id_pessoa) ON DELETE CASCADE
);