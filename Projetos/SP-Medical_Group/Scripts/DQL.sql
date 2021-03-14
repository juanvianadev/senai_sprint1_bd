USE SP_Medical_Group;
GO

SELECT * FROM TiposUsuario;
SELECT * FROM Usuario;
SELECT * FROM Paciente;
SELECT * FROM Clinica;
SELECT * FROM Especialidade;
SELECT * FROM Medico;
SELECT * FROM Situacao;
SELECT * FROM Consulta;

SELECT COUNT(IdUsuario) FROM Usuario;

SELECT IdUsuario, TU.Titulo AS Tipo, Email FROM Usuario U
INNER JOIN TipoUsuario TU
ON U.IdTipoUsuario = TU.IdTipoUsuario;

SELECT 
	IdPaciente, 
	Nome, 
	U.Email,
	DATEDIFF(year, DataNascimento, GETDATE()) AS [Idade],
	FORMAT(DataNascimento, 'd', 'pt-bt') AS [Data de Nascimento],
	Telefone,
	RG,
	CPF,
	CEP,
	Endereco
FROM Paciente P
INNER JOIN Usuario U
ON P.IdUsuario = U.IdUsuario;

SELECT 
	IdClinica,
	Nome,
	CNPJ,
	RazaoSocial,
	CONVERT(VARCHAR(5), HorarioAbertura, 108) AS [Horário de Abertura],
	CONVERT(VARCHAR(5), HorarioFechamento, 108) AS [Horário de Fechamento],
	Endereco
FROM Clinica;

SELECT 
	IdMedico,
	M.Nome,
	U.Email,
	CRM,
	Estado,
	E.Titulo AS Especialidade,
	C.Nome AS [Clínica]
FROM Medico M
INNER JOIN Usuario U
ON M.IdUsuario = U.IdUsuario
INNER JOIN Clinica C
ON M.IdClinica = C.IdClinica
INNER JOIN Especialidade E
ON M.IdEspecialidade = E.IdEspecialidade;

SELECT
	IdConsulta,
	P.Nome AS Paciente,
	M.Nome AS [Médico],
	S.Titulo AS [Situação],
	FORMAT(DataAgendamento, 'd', 'pt-bt') AS [Data de Agendamento],
	FORMAT(DataAgendamento, 'hh:mm') AS [Horário],
	Descricao
FROM Consulta C
INNER JOIN Paciente P
ON C.IdPaciente = P.IdPaciente
INNER JOIN Medico M
ON C.IdMedico = M.IdMedico
INNER JOIN Situacao S
ON C.IdSituacao = S.IdSituacao;

SELECT dbo.QuantidadeDeMedicos('Anestesiologia') AS [Quantidade de Médicos];

EXEC BuscaIdade 'henrique@gmail.com'