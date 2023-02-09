CREATE DATABASE LivrariaABC;

USE LivrariaABC;

############## TABELAS DAS INFORMACOES PESSOAIS ##############


CREATE TABLE UF (
    Cod_UF INT,
    Desc_UF VARCHAR(400),
    CONSTRAINT pk_UF PRIMARY KEY (Cod_UF)
);

CREATE TABLE Cidade (
    Cod_Cidade INT,
    Nome_Cidade VARCHAR(400),
    Cod_UF INT,
    CONSTRAINT pk_Cidade PRIMARY KEY (Cod_Cidade),
    CONSTRAINT fk_Cidade_UF FOREIGN KEY (Cod_UF) REFERENCES UF (Cod_UF)
);
	
CREATE TABLE Bairro (
    Cod_Bairro INT,
    Nome_Bairro VARCHAR(400),
    Cod_Cidade INT,
    CONSTRAINT pk_Bairro PRIMARY KEY (Cod_Bairro),
    CONSTRAINT fk_Bairro_Cidade FOREIGN KEY (Cod_Cidade) REFERENCES Cidade (Cod_Cidade)
);

CREATE TABLE Tipo_Endereco (
	Cod_TipoEnd INT,
    Desc_Tipo VARCHAR(400),
    CONSTRAINT pk_Tipo_Endereco PRIMARY KEY (Cod_TipoEnd)
);

CREATE TABLE Endereco (
    Cod_Endereco INT,
    Nome_Rua VARCHAR(400),
    Complemento VARCHAR(400),
    CEP VARCHAR(400),
    Numero INT,
    Cod_Bairro INT,
    Cod_TipoEnd INT,
    CONSTRAINT pk_Endereco PRIMARY KEY (Cod_Endereco),
    CONSTRAINT fk_Endereco_Bairro FOREIGN KEY (Cod_Bairro) REFERENCES Bairro (Cod_Bairro),
    CONSTRAINT fk_Tipo_Endereco FOREIGN KEY (Cod_TipoEnd) REFERENCES Tipo_Endereco (Cod_TipoEnd)
);

CREATE TABLE Sexo (
	Cod_Sexo INT,
    Desc_Sexo VARCHAR(400),
    CONSTRAINT pk_Sexo PRIMARY KEY (Cod_Sexo)
);

CREATE TABLE Tipo_Telefone (
	Cod_TipoFone INT,
    Desc_TipoFone VARCHAR(400),
    CONSTRAINT pk_Tipo_Telefone PRIMARY KEY (Cod_TipoFone)
);

CREATE TABLE Telefone (
    Cod_Telefone INT,
    Numero_Telefone INT,
    DDD INT,
    Cod_Tipo_Telefone INT,
    CONSTRAINT pk_Telefone PRIMARY KEY (Cod_Telefone),
    CONSTRAINT fk_Tipo_Telefone FOREIGN KEY (Cod_Tipo_Telefone) REFERENCES Tipo_Telefone (Cod_TipoFone)
);

############## TABELAS DO CLIENTE ##############


CREATE TABLE Cliente (
    CPF_Cliente INT,
    Nome_Cliente VARCHAR(400),
    Data_Nasc DATE,
    email VARCHAR(400),
    Cod_Sexo INT,
    CONSTRAINT pk_Cliente PRIMARY KEY (CPF_Cliente),
    CONSTRAINT fk_Sexo_Cliente FOREIGN KEY (Cod_Sexo) REFERENCES Sexo (Cod_Sexo)
);

CREATE TABLE Endereco_has_Cliente (
    CPF_Cliente INT,
    Cod_Endereco INT,
    CONSTRAINT pk_Endereco_has_Cliente PRIMARY KEY (CPF_Cliente,Cod_Endereco),
    CONSTRAINT fk_CPF_CLiente_Endereco FOREIGN KEY (CPF_Cliente) REFERENCES Cliente (CPF_Cliente),
    CONSTRAINT fk_Cod_Endereco FOREIGN KEY (Cod_Endereco) REFERENCES Endereco (Cod_Endereco)
);

CREATE TABLE Cliente_has_Telefone (
    CPF_Cliente INT,
    Cod_Telefone INT,
    CONSTRAINT pk_Cliente_has_Telefone PRIMARY KEY (CPF_Cliente,Cod_Telefone),
    CONSTRAINT fk_CPF_CLiente_Telefone FOREIGN KEY (CPF_Cliente) REFERENCES Cliente (CPF_Cliente),
    CONSTRAINT fk_Cod_Telefone FOREIGN KEY (Cod_Telefone) REFERENCES Telefone (Cod_Telefone)
);

############## TABELAS DO LIVRO/AUTOR ##############


CREATE TABLE Categoria (
	Cod_Categoria INT,
    Desc_Categoria VARCHAR(400),
    CONSTRAINT pk_Categoria PRIMARY KEY (Cod_Categoria)
);

CREATE TABLE Editora (
	Cod_Editora INT,
    Nome_Editora VARCHAR(400),
    CONSTRAINT pk_Editora PRIMARY KEY (Cod_Editora)
);

CREATE TABLE Autor (
    Cod_Autor INT,
    Nome_Autor VARCHAR(400),
    Data_Nasc DATE,
    email VARCHAR(400),
    Cod_Sexo INT,
    CONSTRAINT pk_Autor PRIMARY KEY (Cod_Autor),
    CONSTRAINT fk_Sexo_Autor FOREIGN KEY (Cod_Sexo) REFERENCES Sexo (Cod_Sexo)
);

CREATE TABLE Livro (
    Cod_Livro INT,
    ISBN INT,
    Titulo VARCHAR(400),
    Preco DOUBLE,
    Cod_Editora INT,
    Cod_Categoria INT,
    CONSTRAINT pk_Livro PRIMARY KEY (Cod_Livro),
    CONSTRAINT fk_Editora FOREIGN KEY (Cod_Editora) REFERENCES Editora (Cod_Editora),
    CONSTRAINT fk_Categoria FOREIGN KEY (Cod_Categoria) REFERENCES Categoria (Cod_Categoria)
);

CREATE TABLE Livro_has_Autor (
    Cod_Livro INT,
    Cod_Autor INT,
    CONSTRAINT pk_Livro_has_Autor PRIMARY KEY (Cod_Livro,Cod_Autor),
    CONSTRAINT fk_Livro_Autor FOREIGN KEY (Cod_Livro) REFERENCES Livro (Cod_Livro),
    CONSTRAINT fk_Autor FOREIGN KEY (Cod_Autor) REFERENCES Autor (Cod_Autor)
);

############## TABELAS DO PEDIDO ##############


CREATE TABLE Tipo_Pagamento (
	Cod_Pagamento INT,
    Desc_Pagamento VARCHAR(400),
    CONSTRAINT pk_Pagamento PRIMARY KEY (Cod_Pagamento)
);

CREATE TABLE Cesta (
	Cod_Cesta INT,
    Preco_Total DOUBLE,
    CONSTRAINT pk_Cesta PRIMARY KEY (Cod_Cesta)
);

CREATE TABLE Cesta_has_Livros (
	Id_Add_Cesta INT,
	Cod_Cesta INT,
    Cod_Livro INT,
    CONSTRAINT pk_Cesta_has_Livros PRIMARY KEY (Id_Add_Cesta),
    CONSTRAINT fk_Livro_Cesta FOREIGN KEY (Cod_Livro) REFERENCES Livro (Cod_Livro),
    CONSTRAINT fk_Cesta FOREIGN KEY (Cod_Cesta) REFERENCES Cesta (Cod_Cesta)
);

CREATE TABLE Funcionario (
    Cod_Funcionario INT,
    Nome_Funcionario VARCHAR(400),
    Data_Nasc DATE,
    Cod_Sexo INT,
    CONSTRAINT pk_Funcionario PRIMARY KEY (Cod_Funcionario),
    CONSTRAINT fk_Sexo_Funcionario FOREIGN KEY (Cod_Sexo) REFERENCES Sexo (Cod_Sexo)
);

CREATE TABLE Pedido (
    Cod_Pedido INT,
    Data_Envio DATE,
    Data_Entrega DATE,
    Confirm_Recebido boolean,
    Cod_Cesta INT,
    Cod_Pagamento INT,
    Cod_Endereco INT,
    CPF_Cliente INT,
    Cod_Funcionario INT,
    CONSTRAINT pk_Pedido PRIMARY KEY (Cod_Pedido),
    CONSTRAINT fk_Cesta_Pedido FOREIGN KEY (Cod_Cesta) REFERENCES Cesta (Cod_Cesta),
    CONSTRAINT fk_Pagamento_Pedido FOREIGN KEY (Cod_Pagamento) REFERENCES Tipo_Pagamento (Cod_Pagamento),
    CONSTRAINT fk_Endereco_Pedido FOREIGN KEY (Cod_Endereco) REFERENCES Endereco (Cod_Endereco),
    CONSTRAINT fk_Cliente_Pedido FOREIGN KEY (CPF_Cliente) REFERENCES Cliente (CPF_Cliente),
    CONSTRAINT fk_Funcionario_Pedido FOREIGN KEY (Cod_Funcionario) REFERENCES Funcionario (Cod_Funcionario)
);
