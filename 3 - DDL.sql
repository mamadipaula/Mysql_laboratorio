create database db_laboratorio;

use db_laboratorio;

create table tb_usuario(
		nu_cpf varchar(11) not null,
        no_usuario varchar(100) not null,
        nu_rg varchar(15) not null,
        no_endereco varchar(150),
        st_sexo enum('Feminino','Masculino'),
        dt_nascimento date,
        primary key (nu_cpf),
        unique key (nu_cpf)
    );
    
create table tb_medico(
		nu_crm char(8) not null,
        no_medico varchar(100) not null,
        primary key (nu_crm),
        unique key (nu_crm)
        );
        
create table tb_tecnico(
		co_tecnico int auto_increment not null,
        no_tecnico varchar(100) not null,
        primary key (co_tecnico)
        );
        
        
create table tb_tipo_exame(
		co_tipo_exame int auto_increment not null,
        no_tipo_exame varchar(80) not null,
        nu_resultado_normal decimal(10,2),
        nu_resultado_normal_limite decimal(10,2),
        primary key (co_tipo_exame)
        );
        
   create table tb_seguradora(
		co_seguradora int auto_increment not null,
        no_seguradora varchar(100),
        primary key (co_seguradora)
        );
        
create table tb_riex(
		nu_riex int auto_increment not null,
        no_status enum('Particular','Plano de Saude') not null,
        no_situacao enum('Aberto','Encerrado','Entregue') not null,
        dt_riex datetime not null,
        co_seguradora int,
        nu_cpf varchar(11),
        primary key (nu_riex),
        constraint fk_riex_seguradora foreign key (co_seguradora) references tb_seguradora(co_seguradora),
        constraint fk_riex_usuario foreign key (nu_cpf) references tb_usuario(nu_cpf)
        );
        
create table tb_exame(
		co_exame int auto_increment not null,
        no_exame varchar(100) not null,
        nu_resultado decimal(10,2),
        nu_crm char(8),
        co_tipo_exame int,
        co_tecnico int,
        nu_riex int,
        primary key (co_exame),
        constraint fk_exame_medico foreign key(nu_crm) references tb_medico(nu_crm),
        constraint fk_exame_tipo_exame foreign key(co_tipo_exame) references tb_tipo_exame(co_tipo_exame),
        constraint fk_exame_tecnico foreign key(co_tecnico) references tb_tecnico(co_tecnico),
        constraint fk_exame_riex foreign key(nu_riex) references tb_riex(nu_riex)
        );
        
        show tables;
        