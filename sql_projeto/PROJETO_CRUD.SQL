 CREATE DATABASE PROJETO_CRUD  
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

USE PROJETO_CRUD

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


CREATE TABLE FUNCIONARIOS(
	FUN_ID INT IDENTITY(1,1) NOT NULL,
	FUN_NOME NVARCHAR(45) NOT NULL,
	FUN_DATANASCIMENTO DATETIME,
	FUN_RUA NVARCHAR(45),
	FUN_NUMERO INT,
	FUN_BAIRRO NVARCHAR(45),
	FUN_CIDADE NVARCHAR(20),
	FUN_COMPLEMENTO NVARCHAR(45),
	FUN_CEP NVARCHAR(9),
	FUN_CARGO NVARCHAR(25),
	FUN_SALARIO DECIMAL(10, 2) NOT NULL)

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


CREATE TABLE RECEBIMENTO (
	REC_ID INT IDENTITY (1,1) NOT NULL,
	REC_DESCRICAO NVARCHAR(45) NOT NULL,
	REC_VALOR DECIMAL (10, 2) NOT NULL,
	REC_DATA DATETIME,
	REC_TIPO NVARCHAR(25) NOT NULL
	)

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/