CREATE DATABASE PROJETO_CRUD2  
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

USE PROJETO_CRUD2

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


CREATE TABLE FUNCIONARIOS(
	FUN_ID int IDENTITY(1,1) NOT NULL,
	FUN_NOME nvarchar(50),
	FUN_DATANASCIMENTO datetime,
	FUN_RUA nvarchar(50),
	FUN_NUMERO int,
	FUN_BAIRRO nvarchar(50),
	FUN_CIDADE nvarchar(30),
	FUN_COMPLEMENTO nvarchar(50),
	FUN_CEP nvarchar(9),
	FUN_CARGO nvarchar(50),
	FUN_SALARIO decimal(10, 2))
    
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE PROCEDURE SP_INSERIR_FUNCIONARIO
    @NOME VARCHAR(50),
    @DATA_NASCIMENTO DATETIME,
    @RUA VARCHAR(50),
    @NUMERO INT,
    @BAIRRO VARCHAR(50),
    @CIDADE VARCHAR(30),
    @COMPLEMENTO VARCHAR(50),
    @CEP VARCHAR(9),
    @CARGO VARCHAR(50),
    @SALARIO DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO FUNCIONARIOS (
        FUN_NOME,
        FUN_DATANASCIMENTO,
        FUN_RUA,
        FUN_NUMERO,
        FUN_BAIRRO,
        FUN_CIDADE,
        FUN_COMPLEMENTO,
        FUN_CEP,
        FUN_CARGO,
        FUN_SALARIO
    )
    VALUES (
        @NOME,
        @DATA_NASCIMENTO,
        @RUA,
        @NUMERO,
        @BAIRRO,
        @CIDADE,
        @COMPLEMENTO,
        @CEP,
        @CARGO,
        @SALARIO
    );
END;
GO
/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE PROCEDURE ALTERAR_FUNCIONARIO 
    @NOME VARCHAR(50),
    @DATA_NASCIMENTO DATETIME,
    @RUA VARCHAR(50),
    @NUMERO INT,
    @BAIRRO VARCHAR(50),
    @CIDADE VARCHAR(30),
    @COMPLEMENTO VARCHAR(50),
    @CEP VARCHAR(9),
    @CARGO VARCHAR(50),
    @SALARIO DECIMAL(10, 2)
AS 
BEGIN
	UPDATE
		FUNCIONARIOS
	SET FUN_NOME = @NOME,
		FUN_DATANASCIMENTO = @DATA_NASCIMENTO,
		FUN_RUA = @RUA,
		FUN_NUMERO = @NUMERO,
		FUN_BAIRRO = @BAIRRO,
		FUN_CIDADE = @BAIRRO,
		FUN_COMPLEMENTO = @BAIRRO,
		FUN_CEP = @CEP,
		FUN_CARGO = @CARGO,
		FUN_SALARIO = @SALARIO
END;

/*-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

CREATE PROCEDURE SP_EXCLUIR_FUNCIONARIO
	@ID INTEGER

AS
BEGIN
	DELETE FROM FUNCIONARIOS
	WHERE FUN_ID = @ID
END
