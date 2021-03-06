CREATE DATABASE SP_Medical_Group;
GO

USE SP_Medical_Group;
GO

CREATE TABLE TiposUsuario
(
	IdTipoUsuario		INT PRIMARY KEY IDENTITY,
	Tipo				VARCHAR(100) NOT NULL
);
GO

CREATE TABLE Usuario
(
	IdUsuario			INT PRIMARY KEY IDENTITY,
	IdTipoUsuario		INT FOREIGN KEY REFERENCES TiposUsuario (IdTipoUsuario) NOT NULL,
	Email				VARCHAR(150) NOT NULL,
	Senha				VARCHAR(150) NOT NULL
);
GO

CREATE TABLE Paciente
(
	IdPaciente			INT PRIMARY KEY IDENTITY,
	IdUsuario			INT FOREIGN KEY REFERENCES Usuario (IdUsuario) NOT NULL,
	Nome				VARCHAR(250) NOT NULL,
	DataNascimento		DATE NOT NULL,
	Telefone			VARCHAR(15) NOT NULL,
	RG					CHAR(9) NOT NULL,
	CPF					CHAR(11) NOT NULL,
	CEP					CHAR(8) NOT NULL,
	Endereco			VARCHAR(300) NOT NULL
);
GO

CREATE TABLE Clinica
(
	IdClinica			INT PRIMARY KEY IDENTITY,
	Nome				VARCHAR(200) NOT NULL,
	CNPJ				CHAR(14) NOT NULL,
	RazaoSocial			VARCHAR(200) NOT NULL,
	HorarioAbertura		TIME NOT NULL,
	HorarioFechamento	TIME NOT NULL,
	Endereco			VARCHAR(300) NOT NULL
);
GO

CREATE TABLE Especialidade
(
	IdEspecialidade		INT PRIMARY KEY IDENTITY,
	Especialidade				VARCHAR(300) NOT NULL
);
GO

CREATE TABLE Medico
(
	IdMedico			INT PRIMARY KEY IDENTITY,
	IdUsuario			INT FOREIGN KEY REFERENCES Usuario (IdUsuario) NOT NULL,
	IdClinica			INT FOREIGN KEY REFERENCES Clinica (IdClinica) NOT NULL,
	IdEspecialidade		INT FOREIGN KEY REFERENCES Especialidade (IdEspecialidade) NOT NULL,
	Nome				VARCHAR(250) NOT NULL,
	CRM					CHAR(5) NOT NULL,
	Estado				CHAR(2) NOT NULL
);
GO

CREATE TABLE Situacao
(
	IdSituacao			INT PRIMARY KEY IDENTITY,
	Situacao				VARCHAR(150) NOT NULL
);
GO

CREATE TABLE Consulta
(
	IdConsulta			INT PRIMARY KEY IDENTITY,
	IdPaciente			INT FOREIGN KEY REFERENCES Paciente (IdPaciente) NOT NULL,
	IdMedico			INT FOREIGN KEY REFERENCES Medico (IdMedico) NOT NULL,
	IdSituacao			INT FOREIGN KEY REFERENCES Situacao (IdSituacao) DEFAULT(1),
	DataAgendamento		DATETIME NOT NULL,
	Descricao			VARCHAR(350)
);
GO