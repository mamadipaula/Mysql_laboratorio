use db_laboratorio;

insert into tb_usuario values 
('14619669148','Marcela de Paula Ferreira','2956841','QR 310 conjunto 12 casa 06,Samambaia Sul,Brasilia,DF','Feminino','1992-01-21'),
('75251731175','Daniel de Oliveira','235598','QNM 34 conjunto A2 casa 38,Taguatinga,Brasilia,DF','Masculino','1987-07-08'),
('51222098121','Ilma Valina de Paula','785214','Qr 310 conjunto 12 casa 07,Samambaia Sul,Brasilia,DF','Feminino','1962-08-25'),
('59546202100','Talita de Paula Ferreira','7859641','Avenida das Palmeiras 731,Manaíra,João Pessoa','Feminino','1987-07-17'),
('21700149180','Eduardo de Jesus','569852','QR 318 conjunto 06 lote 12, Samambaia Sul,Brasilia,DF','Masculino','1962-01-15'),
('18651642164','Geovana de Assis','256985','Avenida das Palmeiras 451,Taguatinga,Brasilia,DF','Feminino','2000-05-02'),
('63180705167','Maria Rosa Rodrigues','569854','QR 518 conjunto 4 casa 25,Samambaia Sul,Brasilia,DF','Feminino','1999-07-01'),
('40297462172','Augusto Rafael','965847','QNM 30 conjunto C2 casa 28,Taguatinga,Brasilia,DF','Masculino','1960-08-15'),
('48891196126','Ursula Maria Ferreira','253695','QNM 24 conjunto A casa 15,Taguatinga,Brasilia,DF','Feminino','2005-01-23'),
('34933482152','Emanuel da Silva','695847','QNM 34 conjunto A2 casa 11,Taguatinga,Brasilia,DF','Masculino','1998-11-26');

select * from tb_usuario;

insert into tb_medico values
('153268DF','Mauro Albuquerque'),
('253625DF','Juliana Moreira'),
('256984DF','Janaina Alves'),
('856954GO','Wanderley Cunha'),
('695847GO','Augusto Moreira'),
('856471DF','Marcela Alvez'),
('215364DF','Maria Flor Gonsalvez'),
('548963DF','Margareth Alvez'),
('569854DF','Mauricio Alcantara'),
('213654GO','Luisa Melo');

select * from tb_medico;

insert into tb_tecnico values
(default,'Marcio Augusto'),
(default,'Maria Jesus'),
(default,'Edmilson Fernandez'),
(default,'Wilson Moraes'),
(default,'Janete Gomez'),
(default,'Marjore Maria'),
(default,'Mauricio Bento Ribeiro'),
(default,'Camila de Souza'),
(default,'Edmilson Fernades'),
(default,'Maria Margareth Menezes');

select * from tb_tecnico;

insert into tb_tipo_exame values
(default,'Eritócitos','4.0','5.50'),
(default,'Hemoglobina','12','15.7'),
(default,'Hematócrito','37','46'),
(default,'VCM','82','92'),
(default,'HCM','27','31'),
(default,'Leucócitos','4000','10000'),
(default,'Eosinófilos','40','500'),
(default,'Basófilos','0','200'),
(default,'Linfócitos','1200','4600'),
(default,'Monócitos','0','1224'),
(default,'Mielócitos','0',null),
(default,'Metamielócitos','0','100'),
(default,'Bastonetes','43','1000'),
(default,'Segmentados','1400','6000'),
(default,'Neutrófilos','1075','7300'),
(default,'Plaquetas','140000','450000'),
(default,'Potássio','3.5','5.1'),
(default,'Sódio','136.0','145.0'),
(default,'Tempo de Prot-Paciente(seg.) TP',null,null),
(default,'Ativ. da Prot-Paciente(%)',70,null),
(default,'Rel.Paciente Controle',null,null),
(default,'RNI','0.1','1.2'),
(default,'Creatina','0.6','1.3'),
(default,'Uréia','17.0','49.0'),
(default,'Potássio','3.5','5.1'),
(default,'Sódio','136.0','145.0');

select * from tb_tipo_exame;

insert into tb_seguradora values
(default,'Norte America'),
(default,'Pradesco'),
(default,'Zamil'),
(default,'Aeroporto Seguro'),
(default,'Zelicorp'),
(default,'Silver Cross'),
(default,'Duomed'),
(default,'Tamoc'),
(default,'Saúde Sempre'),
(default,'NostraDame');

select * from tb_seguradora;

insert into tb_riex values
(default,'Plano de Saude','Encerrado','2022-04-20','2','14619669148'),
(default,'Plano de Saude','Entregue','2022-01-21','7','51222098121'),
(default,'Particular','Entregue','2022-02-05',null,'48891196126'),
(default,'Plano de Saude','Entregue','2022-03-25','6','34933482152'),
(default,'Particular','Aberto','2022-05-01',null,'18651642164'),
(default,'Particular','Aberto','2022-05-02',null,'40297462172'),
(default,'Particular','Entregue','2022-01-25',null,'48891196126'),
(default,'Plano de Saude','Encerrado','2022-04-30','5','59546202100');

select * from tb_riex;


insert into tb_exame values
(default,'Hemograma','4.96','153268DF','1','1','1'),
(default,'Hemograma','14.5','153268DF','2','1','1'),
(default,'Hemograma','43.9','153268DF','3','1','1'),
(default,'Hemograma','88.5','153268DF','4','1','1'),
(default,'Hemograma','29.2','153268DF','5','1','1'),
(default,'Hemograma','4900','153268DF','6','1','1'),
(default,'Hemograma','147','153268DF','7','1','1'),
(default,'Hemograma','49','153268DF','8','1','1'),
(default,'Hemograma','1666','153268DF','9','1','1'),
(default,'Hemograma','441','153268DF','10','1','1'),
(default,'Hemograma','0','153268DF','11','1','1'),
(default,'Hemograma','0','153268DF','12','1','1'),
(default,'Hemograma','0','153268DF','13','1','1'),
(default,'Hemograma','53','153268DF','14','1','1'),
(default,'Hemograma','53','153268DF','15','1','1'),
(default,'Hemograma','195000','153268DF','16','1','1'),
(default,'Coagulograma Completo','30.6','548963DF','17','3','2'),
(default,'Coagulograma Completo','24','548963DF','18','3','2'),
(default,'Coagulograma Completo','2.46','548963DF','19','3','2'),
(default,'Coagulograma Completo','2.98','548963DF','20','3','2'),
(default,'Creatina','0.50','213654GO','21','6','3'),
(default,'Uréia','15','856954GO','22','9','4'),
(default,'Potássio',null,'253625DF','23','10','5'),
(default,'Sódio',null,'548963DF','24','5','6'),
(default,'Potássio','4.3','253625DF','23','10','7'),
(default,'Sódio','141','548963DF','24','5','8');

select * from tb_exame;



