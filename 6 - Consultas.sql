use db_laboratorio;

/*8.1) Quais são os tipos de exames que o laboratório realiza e qual o resultado normal esperado para cada tipo de exame*/
create or replace view vw_tipo_exame_resultado_normal as
	select no_tipo_exame 'Tipo de exame', 
	   nu_resultado_normal 'Valor resultado normal', 
       nu_resultado_normal_limite 'Valor resultado normal limite'
	from tb_tipo_exame;
    
select * from vw_tipo_exame_resultado_normal;
    


/*8.2) A situação de cada RIEX (aberto, encerrado ou entregue)*/
create or replace view vw_riex_situacao as
	select nu_riex 'Numero da RIEX',
	   no_situacao 'Situação'
	from tb_riex;
    
select * from vw_riex_situacao;

/*8.3) Para cada RIEX, qual o usuário associado a ela (nome, endereço, sexo e nascimento)*/
create or replace view vw_riex_usuario as
	select tb_riex.nu_riex 'Numero da RIEX',
	   tb_usuario.no_usuario 'Nome do Usuario',
       tb_usuario.no_endereco 'Endereço',
       tb_usuario.st_sexo 'Sexo',
       tb_usuario.dt_nascimento 'Data de Nascimento'
	from tb_riex
	inner join tb_usuario
	on tb_usuario.nu_cpf = tb_riex.nu_cpf
	order by tb_riex.nu_riex;
    
select * from vw_riex_usuario;

/*8.4) Qual a quantidade de requisições feitas por período (entre 2 datas) bettwen*/ 
create or replace view vw_qnt_requisiçoes_data as
	select count(nu_riex) 'Quantidade de Requisições'
	from tb_riex
	where convert(dt_riex, date) between '2000-01-01' and '2022-04-30'
	order by dt_riex; 
    
select * from vw_qnt_requisiçoes_data;
    
/*8.5) Quais são os tipos de exames que foram solicitadas para a cada requisição*/
create or replace view vw_tipo_exame_riex as
	select tb_tipo_exame.no_tipo_exame 'Tipo Exame',
	   tb_riex.nu_riex 'Numero da Requisição'
	from tb_exame
	inner join tb_tipo_exame
	on tb_tipo_exame.co_tipo_exame = tb_exame.co_tipo_exame
	inner join tb_riex
	on tb_riex.nu_riex = tb_exame.nu_riex;
    
select * from vw_tipo_exame_riex;

/*8.6) Quais os resultados obtidos para cada tipo de exame de cada RIEX?*/
create or replace view vw_resultado_tipo_exame_RIEX as
	select tb_exame.nu_resultado 'Resultado',
	   tb_tipo_exame.no_tipo_exame'Tipo de Exame',
       tb_riex.nu_riex 'Numero da Requisição'
	from tb_exame
	inner join tb_riex
	on tb_riex.nu_riex = tb_exame.nu_riex
	inner join tb_tipo_exame
	on tb_tipo_exame.co_tipo_exame = tb_exame.co_tipo_exame;
    
select * from vw_resultado_tipo_exame_RIEX;

/*8.7) Para cada tipo de exame de uma requisição, qual o médico (CRM e nome) que solicitou*/
create or replace view vw_tipo_exame_RIEX_medico as
	select tb_tipo_exame.no_tipo_exame 'Tipo de Exame',
	   tb_riex.nu_riex 'Número Requisição',
       tb_medico.nu_crm 'Número CRM',
       tb_medico.no_medico 'Nome do Medico'
	from tb_exame
	inner join tb_tipo_exame
	on tb_tipo_exame.co_tipo_exame = tb_exame.co_tipo_exame
	inner join tb_riex
	on tb_riex.nu_riex = tb_exame.nu_riex
	inner join tb_medico
	on tb_medico.nu_crm = tb_exame.nu_crm
	order by tb_riex.nu_riex;
    
select * from vw_tipo_exame_RIEX_medico;

/*8.8) Para cada exame de uma RIEX, qual o responsável pelo resultado (matrícula e nome)*/
create or replace view vw_RIEX_tecnico_tipo_exame as
	select tb_riex.nu_riex 'Numero do Registro',
	   tb_tecnico.co_tecnico 'Codigo do Tecnico',
       tb_tecnico.no_tecnico 'Nome do Tecnico',
       tb_tipo_exame.no_tipo_exame 'Nome Tipo de Exame'
	from tb_exame
	inner join tb_riex
	on tb_riex.nu_riex = tb_exame.nu_riex
	inner join tb_tecnico
	on tb_tecnico.co_tecnico = tb_exame.co_tecnico
    inner join tb_tipo_exame
    on tb_tipo_exame.co_tipo_exame = tb_exame.co_tipo_exame;
    
    select * from vw_RIEX_tecnico_tipo_exame;

/*8.9) Dada a identificação de uma seguradora, quais foram as requisições cobertas por ela.*/
create or replace view vw_seguradora_RIEX as
	select tb_seguradora.co_seguradora 'Código Seguradora',
		   tb_seguradora.no_seguradora 'Nome da Seguradora',
	   tb_riex.nu_riex 'Número Registro'
	from tb_riex
	inner join tb_seguradora
	on tb_seguradora.co_seguradora = tb_riex.co_seguradora;
    
select * from vw_seguradora_RIEX;


