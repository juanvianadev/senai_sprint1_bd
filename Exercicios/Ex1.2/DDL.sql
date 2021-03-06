CREATE DATABASE Locadora;
USE Locadora;

CREATE TABLE Empresa
(
	IdEmpresa	INT	PRIMARY KEY	IDENTITY,
	Nome		VARCHAR(200) NOT NULL
);

CREATE TABLE Marca
(
	IdMarca	INT	PRIMARY KEY	IDENTITY,
	Nome		VARCHAR(200) NOT NULL
);

CREATE TABLE Modelo
(
	IdModelo	INT PRIMARY KEY IDENTITY,
	Nome		VARCHAR(200) NOT NULL,
	IdMarca		INT FOREIGN KEY REFERENCES Marca(IdMarca)
);

CREATE TABLE Veiculo
(
	IdVeiculo	INT PRIMARY KEY IDENTITY,
	Placa		CHAR NOT NULL,
	IdEmpresa	INT FOREIGN KEY REFERENCES Empresa (IdEmpresa),
	IdModelo	INT FOREIGN KEY REFERENCES Modelo (IdModelo)
);

CREATE TABLE Cliente
(
	IdCliente	INT PRIMARY KEY IDENTITY,
	Nome		VARCHAR(150) NOT NULL,
	CPF			CHAR NOT NULL
);

CREATE TABLE Aluguel
(
	IdAluguel		INT PRIMARY KEY IDENTITY,
	Valor			MONEY NOT NULL,
	IdVeiculo		INT FOREIGN KEY REFERENCES Veiculo (IdVeiculo),
	IdCliente		INT FOREIGN KEY REFERENCES Cliente (IdCliente),
	DataDeRetirada	DATE NOT NULL,
	DataDeEntrega	DATE NOT NULL
);