delimiter ||

create procedure pc_buscar_exame (in qtd_de_exame int)
begin
	select * from db_laboratorio.tb_exame
    limit qtd_de_exame;
end ||


call pc_buscar_exame (5);
