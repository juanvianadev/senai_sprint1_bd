USE SENAI_HROADS_MANHA;

INSERT INTO Classe(Nome)
VALUES			  ('Bárbaro'),
				  ('Monge'),
				  ('Arcanista'),
				  ('Cruzado'),
				  ('Caçador de Demônios'),
				  ('Necromante'),
				  ('Feiticeiro');

UPDATE Classe
SET Nome = ('Necromancer')
WHERE IdClasse = 6;

INSERT INTO Personagem (IdClasse, Nome, CapacicadeMaximaVida, CapacicadeMaximaMana, DataAtualizacao, DataCriacao)
VALUES				   (	1,	'DeuBug',		100,					80,				GETDATE(),	 18/01/2019),
					   (	2,	'BitBug',		70,						100,			GETDATE(),	 17/03/2016),
					   (	3,	'Fer8',			75,						60,				GETDATE(),	 18/03/2018);

UPDATE Personagem
SET Nome = ('Fer7')
WHERE Nome = 3;

INSERT INTO TipoHabilidade(Nome)
VALUES		('Ataque'),
			('Defesa'),
			('Cura'),
			('Magia');

INSERT INTO Habilidade(IdClasse,IdTipoHabilidade, Nome)
VALUES		(1, 1, 'Lança Mortal'),
			(2, 2, 'Escudo do Supremo'),
			(3, 3, 'Recuperar Vida');