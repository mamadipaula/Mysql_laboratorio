use db_laboratorio;

DELIMITER $
CREATE FUNCTION fc_validar_CPF(nu_cpf varchar(11)) 
RETURNS varchar(20)
deterministic
BEGIN
    DECLARE SOMA INT;
    DECLARE INDICE INT;
    DECLARE DIGITO_1 INT;
    DECLARE DIGITO_2 INT;
    DECLARE NR_DOCUMENTO_AUX VARCHAR(11);
   
 DECLARE DIGITO_1_nu_cpf CHAR(2);
    DECLARE DIGITO_2_nu_cpf CHAR(2);
    /*
    Remove os CPFs onde todos os números são iguais
    */
    SET NR_DOCUMENTO_AUX = LTRIM(RTRIM(nu_cpf));
    IF (NR_DOCUMENTO_AUX IN ('00000000000', '11111111111', '22222222222', '33333333333', '44444444444', '55555555555', '66666666666', '77777777777', '88888888888', '99999999999', '12345678909')) THEN
        RETURN 'CPF Inválido';
	END IF;
   /*
   O CPF deve ter 11 caracteres 
   */
    IF (LENGTH(NR_DOCUMENTO_AUX) <> 11) THEN
        RETURN 'CPF Inválido';
    ELSE 
 /* 
   Armazendo os digitos verificadores do CPF informado 
   */
   SET DIGITO_1_nu_cpf = SUBSTRING(NR_DOCUMENTO_AUX,LENGTH(NR_DOCUMENTO_AUX)-1,1);
   SET DIGITO_2_nu_cpf = SUBSTRING(NR_DOCUMENTO_AUX,LENGTH(NR_DOCUMENTO_AUX),1);
   
 /*Cálculo do primeiro dígito verificador*/
        SET SOMA = 0;
        SET INDICE = 1;
        WHILE (INDICE <= 9) DO          
            SET Soma = Soma + CAST(SUBSTRING(NR_DOCUMENTO_AUX,INDICE,1) AS UNSIGNED) * (11 - INDICE);             
            SET INDICE = INDICE + 1;      
         END WHILE;      
         SET DIGITO_1 = 11 - (SOMA % 11);      
         IF (DIGITO_1 > 9) THEN
            SET DIGITO_1 = 0;
         END IF;
         
        /* Cálculo do segundo dígito verificador */
        SET SOMA = 0;
        SET INDICE = 1;
        WHILE (INDICE <= 10) DO
             SET Soma = Soma + CAST(SUBSTRING(NR_DOCUMENTO_AUX,INDICE,1) AS UNSIGNED) * (12 - INDICE);              
             SET INDICE = INDICE + 1;
        END WHILE;
        SET DIGITO_2 = 11 - (SOMA % 11);
        IF DIGITO_2 > 9 THEN
            SET DIGITO_2 = 0;
        END IF;
        
        /* Validando os digitos verificadores calculados com os digitos verificadores do CPF informado */
        IF (DIGITO_1 = DIGITO_1_nu_cpf) AND (DIGITO_2 = DIGITO_2_nu_cpf) THEN
            RETURN 'CPF Válido';
        ELSE
            RETURN 'CPF Inválido';
        END IF;
 END IF;
END;
$

SELECT nu_cpf 'Numero cpf', fc_validar_CPF(nu_cpf) as Resultado FROM tb_usuario;