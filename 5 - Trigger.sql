use db_laboratorio;

/* Trigger mudança nome usuario*/
create table tb_mudanca_usuario(
		co_mudanca int auto_increment not null,
        nu_cpf varchar(11) not null,
        no_anterior varchar(100) not null,
        no_novo varchar(100) not null,
        dt_mudanca datetime,
		action varchar(50) default null,
        primary key(co_mudanca)
        );
        

create trigger tg_mudanca_nome
before 
update on tb_usuario for each row
	insert into tb_mudanca_usuario
    set action = 'Atualização',
    nu_cpf = old.nu_cpf,
    no_anterior = old.no_usuario,
    no_novo = new.no_usuario,
    dt_mudanca = now();


update tb_usuario
set no_usuario = 'Manoela Gabriela da Silva'
where nu_cpf = '63180705167';

select * from tb_mudanca_usuario;

/*Trigger mudança endereço usuário*/
create table tb_mudanca_endereco(
	co_mudanca int auto_increment not null,
    nu_cpf varchar(11) not null,
    no_endereco_anterior varchar(100) not null,
    no_endereco_novo varchar(100) not null,
    dt_mudanca datetime not null,
    action varchar(50) default null,
    primary key(co_mudanca)
    );
    
create trigger tg_mudanca_endereco
before
update on tb_usuario for each row
	insert into tb_mudanca_endereco
	set action = 'Atualização',
    nu_cpf = old.nu_cpf,
    no_endereco_anterior = old.no_endereco,
    no_endereco_novo = new.no_endereco,
    dt_mudanca = now();
    
update tb_usuario
set no_endereco = 'Qr 310 conjunto 12 casa 06,Samambaia Sul, DF'
where nu_cpf = '59546202100';

select * from tb_mudanca_endereco;

