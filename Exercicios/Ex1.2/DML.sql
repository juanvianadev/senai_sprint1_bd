USE Locadora;

INSERT INTO Empresa (Nome)
VALUES ('Empresa1'),
	   ('Empresa2');

INSERT INTO Marca (Nome)
VALUES ('Fiat'),
	   ('Ferrari');

INSERT INTO Modelo (Nome, IdMarca)
VALUES ('Modelo1', 1),
	   ('Modelo2', 2);

INSERT INTO Veiculo (Placa, IdModelo, IdEmpresa)
VALUES ('AAA-111', 1, 1),
	   ('BBB-222', 2, 2);

INSERT INTO Cliente (Nome, CPF)
VALUES ('João', '11111111111'),
	   ('Maria', '22222222222');

INSERT INTO Aluguel (IdCliente, IdVeiculo, Valor, DataDeRetirada, DataDeEntrega)
VALUES (1, 2, 100, '01/01/2021', '02/02/2021'),
	   (2, 1, 150, '03/03/2021', '04/04/2021');
