/*Parte3*/

create table especialidade (
id_especialidade int(11) auto_increment primary key, 
nome_especialidade varchar (100)
);

create table convenio (
id_convenio int (11) auto_increment primary key,
nome varchar (200), 
tempo_carencia varchar (20), 
cnpj varchar (14)
);

create table medico (
id_medico int (11) auto_increment primary key,
nome varchar (200),
cpf varchar (15) unique not null,
crm varchar (15),
id_especialidade int not null,
foreign key (id_especialidade) references especialidade (id_especialidade)
);

create table paciente (
id_paciente int (11) auto_increment primary key,
nome varchar (200),
data_nascimento date,
cpf varchar (15) unique not null,
rg varchar (10) unique not null,
email varchar (50),
id_convenio int,
foreign key  (id_convenio) references convenio (id_convenio)
);

create table enfermaria (
id_enfermeiro int (11) auto_increment primary key,
nome varchar (200),
cpf varchar (15) unique not null,
cre varchar (13)
);

create table consulta (
id_consulta int (11) auto_increment primary key,
id_medico int (11) not null,
id_paciente int (11) not null,
id_especialidade int (11) not null,
id_convenio int (11),
horario time,
data_consulta date,
valor_consulta decimal,
foreign key  (id_medico) references medico (id_medico),
foreign key  (id_paciente) references paciente (id_paciente),
foreign key  (id_convenio) references convenio (id_convenio),
foreign key  (id_especialidade) references especialidade (id_especialidade)
);

create table receita (
id_receita int (11) auto_increment primary key,
medicamentos text,
id_consulta int (11),
foreign key  (id_consulta) references consulta (id_consulta)
);

create table tipo_quarto (
id_tipo_quarto int (11) auto_increment primary key,
valor decimal,
descricao varchar (50)
);

create table quarto (
id_quarto int (11) auto_increment primary key,
numero int,
id_tipo_quarto int (11) not null,
foreign key  (id_tipo_quarto) references tipo_quarto (id_tipo_quarto)
);

create table internacao (
id_internacao int (11) auto_increment primary key,
id_paciente int (11) not null,
id_medico int (11) not null,
id_enfermeiro int (11) not null,
id_quarto int (11) not null,
procedimento text,
data_entrada date,
prev_alta date,
data_alta date,
foreign key  (id_paciente) references paciente (id_paciente),
foreign key  (id_medico) references medico (id_medico),
foreign key  (id_enfermeiro) references enfermaria (id_enfermeiro),
foreign key  (id_quarto) references quarto (id_quarto)
);

insert into convenio(id_convenio, nome, cnpj, tempo_carencia) values(1, 'Brasil', '9852143614751', '30 dias');
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) values(2, 'Intermédica', '47810596327845', '24 horas');
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) values(3, 'Saude', '36149520784195', '24 das');
insert into convenio(id_convenio, nome, cnpj, tempo_carencia) values(4, 'MaisSaude', '29814536710254', '180 dias');

insert into especialidade(id_especialidade, nome_especialidade) values(1, 'Pediatria');
insert into especialidade(id_especialidade, nome_especialidade) values(2, 'Clínica geral');
insert into especialidade(id_especialidade, nome_especialidade) values(3, 'Gastroenterologia');
insert into especialidade(id_especialidade, nome_especialidade) values(4, 'Dermatologia');
insert into especialidade(id_especialidade, nome_especialidade) values(5, 'Oftalmologia');
insert into especialidade(id_especialidade, nome_especialidade) values(6, 'Ortopedia');
insert into especialidade(id_especialidade, nome_especialidade) values(7, 'Psiquiatria');

insert into tipo_quarto(id_tipo_quarto, valor, descricao) values(1, '1000.00', 'Apartamento');
insert into tipo_quarto(id_tipo_quarto, valor, descricao) values(2, '700.00', 'Quartos duplos');
insert into tipo_quarto(id_tipo_quarto, valor, descricao) values(3, '500.00', 'Enfermaria');

insert into medico(id_medico, nome, cpf, crm, id_especialidade) values(1, 'João Pedro', '1472581234', '745896', 1); 
insert into medico(id_medico, nome, cpf, crm, id_especialidade) values(2, 'Maria Joana', '5897758123', '985896', 2); 
insert into medico(id_medico, nome, cpf, crm, id_especialidade) values(3, 'Vitória Caroline', '1472581763', '455896', 3); 
insert into medico(id_medico, nome, cpf, crm, id_especialidade) values(4, 'Ana Carolina', '4725815987', '225896', 4); 
insert into medico(id_medico, nome, cpf, crm, id_especialidade) values(5, 'Amanda Vieira', '2369874103', '524598', 5); 
insert into medico(id_medico, nome, cpf, crm, id_especialidade) values(6, 'Vania Rodrigues', '9685630178', '369874', 7); 
insert into medico(id_medico, nome, cpf, crm, id_especialidade) values(7, 'Diogo Santos', '1036987620', '216598', 6); 
insert into medico(id_medico, nome, cpf, crm, id_especialidade) values(8, 'Gabriel Gomes', '7869354103', '785410', 2); 
insert into medico(id_medico, nome, cpf, crm, id_especialidade) values(9, 'Sonia Maria', '2369784125', '960325', 3); 
insert into medico(id_medico, nome, cpf, crm, id_especialidade) values(10, 'Carlos Roberto', '1636987452', '019874', 4); 


insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(1, 'Roberta Gomes Silva', '2000-07-09', '74951879', '2369742-x', 'roberta.gomes@gmail.com', 1);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(2, 'Ana Carolina Santos', '1980-05-19', '4590367', '5630257-x', 'ana.carol@gmail.com', 2);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(3, 'Renata Gomes', '2005-02-06', '98743069', '7826304-x', 'renata.gomes@gmail.com', 3);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(4, 'Stefanie freitas', '2007-12-09', '24987630', '9856304-x', 'stefanie.freitas@gmail.com', 4);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(5, 'Esther Valentina', '1985-03-11', '10579684', '0398746-x', 'esther.valentina@gmail.com', null);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(6, 'Bruna Vicente', '1978-05-03', '57306975', '9863013-x', 'bruna.vicente@gmail.com', null);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(7, 'Michele Santos', '2005-08-19', '14960358', '1536980-x', 'michele.santos@gmail.com', null);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(8, 'Maria Aparecida', '2006-09-09', '23978560', '2597639-x', 'maria.aparecida@gmail.com', null);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(9, 'Brenda Santos', '2007-07-12', '46983025', '7456983-x', 'brenda.santos@gmail.com', 1);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(10, 'João Miguel', '2008-08-08', '36748903', '8974623-x', 'joao.miguel@gmail.com', null);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(11, 'Alicia Lopes', '2009-09-09', '12697830', '9687453-x', 'alicia.lopes@gmail.com', null);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(12,'Gabriela Rodrigues','2002-03-02', '74951833', '1462073-x', 'gabriela.rodrigues@gmail.com', 2);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(13, 'André Santos', '2010-10-05', '74951822', '1462071-x', 'andre.santos@gmail.com', null);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(14, 'Carla Gomes', '2015-02-05', '74951898', '1462072-x', 'carla.gomes@gmail.com', null);
insert into paciente(id_paciente, nome, data_nascimento, cpf, rg, email, id_convenio) values(15, 'Fabio Loures', '2000-07-09', '63952078', '1462070-x', 'fabio.loures@gmail.com', 4);

insert into enfermaria(id_enfermeiro, nome, cpf, cre) values(1, 'Maria Vitória', 02369874, '769530');
insert into enfermaria(id_enfermeiro, nome, cpf, cre) values(2, 'Giovana Chaves', 98746532, '857360');
insert into enfermaria(id_enfermeiro, nome, cpf, cre) values(3, 'Carlos Miguel', 23698741, '698532');
insert into enfermaria(id_enfermeiro, nome, cpf, cre) values(4, 'Bruno Almeida', 78630156, '987462');
insert into enfermaria(id_enfermeiro, nome, cpf, cre) values(5, 'Caroline Silva', 25741036, '457830');
insert into enfermaria(id_enfermeiro, nome, cpf, cre) values(6, 'Laura Freitas', 25987410, '479630');
insert into enfermaria(id_enfermeiro, nome, cpf, cre) values(7, 'Larissa Holanda', 98742301, '639874');
insert into enfermaria(id_enfermeiro, nome, cpf, cre) values(8, 'Melissa Rodrigues', 75369801, '203697');
insert into enfermaria(id_enfermeiro, nome, cpf, cre) values(9, 'Gabriela Gomes', 25987423, '894130');
insert into enfermaria(id_enfermeiro, nome, cpf, cre) values(10, 'Lucas Gomes', 56987430, '236972');

insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(1, '2022-03-01', '07:00:00', '200.00', 1, 1, 1, 1);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(2, '2022-02-02', '08:00:00', '150.00', 2, 2, 2, 2);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(3, '2021-01-03', '09:10:00', '500.00', 3, 3, 3, 3);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(4, '2020-04-04', '10:00:00', '360.00', 4, 4, 4, 4);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(5, '2019-05-05', '11:15:00', '220.00', 1, 5, 5, 5);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(6, '2018-06-06', '12:20:00', '100.00', 2, 6, 6, 6);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(7, '2017-07-07', '13:50:00', '540.00', 3, 7, 7, 7);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(8, '2016-08-08', '14:30:00', '360.00', 4, 8, 8, 5);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(9, '2015-09-09', '15:40:00', '210.00', 1, 9, 9, 3);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(10, '2018-10-10', '16:00:00', '320.00', 2, 10, 10, 2);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(11, '2021-11-11', '07:25:00', '410.00', 3, 9, 11, 6);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(12, '2020-12-12', '06:00:00', '600.00', 4, 8, 12, 2);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(13, '2021-09-13', '12:00:00', '230.00', 1, 7, 13, 1);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(14, '2016-08-14', '13:00:00', '140.00', 2, 6, 14, 5);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(15, '2017-07-15', '13:40:00', '250.00', 3, 5, 15, 6);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(16, '2018-06-16', '14:40:00', '390.00', 4, 4, 5, 1);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(17, '2019-05-17', '13:10:00', '500.00', 1, 3, 2, 2);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(18, '2020-04-18', '14:20:00', '260.00', 2, 2, 1, 5);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(19, '2021-03-19', '15:30:00', '280.00', 3, 1, 10, 4);
insert into consulta(id_consulta, data_consulta, horario, valor_consulta, id_convenio, id_medico, id_paciente, id_especialidade) values(20, '2022-02-20', '16:00:00', '290.00', 4, 2, 12, 7);


insert into receita(id_receita, medicamentos, id_consulta) values(2, 'Roacutan', 1);
insert into receita(id_receita, medicamentos, id_consulta) values(1, 'Neosaldina', 2);
insert into receita(id_receita, medicamentos, id_consulta) values(3, 'Engov', 5);
insert into receita(id_receita, medicamentos, id_consulta) values(4, 'Novalgina', 6);
insert into receita(id_receita, medicamentos, id_consulta) values(5, 'Lisador', 7);
insert into receita(id_receita, medicamentos, id_consulta) values(6, 'Doralgina', 8);
insert into receita(id_receita, medicamentos, id_consulta) values(7, 'Sonrisal', 9);
insert into receita(id_receita, medicamentos, id_consulta) values(8, 'Doril', 10);
insert into receita(id_receita, medicamentos, id_consulta) values(9, 'Toragesic',11);
insert into receita(id_receita, medicamentos, id_consulta) values(10, 'Dipirona',12);
insert into receita(id_receita, medicamentos, id_consulta) values(11, 'Tylenol', 13);

insert into quarto(id_quarto, numero, id_tipo_quarto) values(1, 02, 1);
insert into quarto(id_quarto, numero, id_tipo_quarto) values(2, 03, 2);
insert into quarto(id_quarto, numero, id_tipo_quarto) values(3, 04, 3);
insert into quarto(id_quarto, numero, id_tipo_quarto) values(4, 05, 3);
insert into quarto(id_quarto, numero, id_tipo_quarto) values(5, 06, 1);

insert into internacao(id_internacao, data_entrada, prev_alta, data_alta, procedimento, id_paciente, id_medico, id_enfermeiro, id_quarto) values (1, '2015-01-01', '2015-01-15', '2015-01-15', 'Lorem Ipsum is simply dummy text of the printing and', 8, 5, 1, 1);
insert into internacao(id_internacao, data_entrada, prev_alta, data_alta, procedimento, id_paciente, id_medico, id_enfermeiro, id_quarto) values (2, '2016-01-01', '2016-01-15', '2016-01-15', 'Lorem Ipsum is simply dummy text of the printing and', 9, 8, 2,2);
insert into internacao(id_internacao, data_entrada, prev_alta, data_alta, procedimento, id_paciente, id_medico, id_enfermeiro, id_quarto) values (3, '2017-01-01', '2017-01-15', '2017-01-15', 'Lorem Ipsum is simply dummy text of the printing and', 10, 7, 3, 3);
insert into internacao(id_internacao, data_entrada, prev_alta, data_alta, procedimento, id_paciente, id_medico, id_enfermeiro, id_quarto) values (4, '2018-01-01', '2018-01-15', '2018-01-15', 'Lorem Ipsum is simply dummy text of the printing and', 5, 6, 5, 4);
insert into internacao(id_internacao, data_entrada, prev_alta, data_alta, procedimento, id_paciente, id_medico, id_enfermeiro, id_quarto) values (5, '2019-01-01', '2019-01-15', '2019-01-15', 'Lorem Ipsum is simply dummy text of the printing and', 2, 2, 8, 5);
insert into internacao(id_internacao, data_entrada, prev_alta, data_alta, procedimento, id_paciente, id_medico, id_enfermeiro, id_quarto) values (6, '2020-01-01', '2020-01-15', '2020-01-15', 'Lorem Ipsum is simply dummy text of the printing and', 14, 1, 9, 1);
insert into internacao(id_internacao, data_entrada, prev_alta, data_alta, procedimento, id_paciente, id_medico, id_enfermeiro, id_quarto) values (7, '2021-01-01', '2021-01-15', '2021-01-15', 'Lorem Ipsum is simply dummy text of the printing and', 15, 10, 10, 2);

/*Parte 4*/


alter table medico add em_atividade varchar(100);

update medico set em_atividade = 'Ativo' where id_medico = 1;
update medico set em_atividade = 'Inativo' where id_medico = 2;
update medico set em_atividade = 'Ativo' where id_medico = 3;
update medico set em_atividade = 'Ativo' where id_medico = 4;
update medico set em_atividade = 'Ativo' where id_medico = 5;
update medico set em_atividade = 'Inativo' where id_medico = 6;
update medico set em_atividade = 'Ativo' where id_medico = 7;
update medico set em_atividade = 'Ativo' where id_medico = 8;
update medico set em_atividade = 'Ativo' where id_medico = 9;
update medico set em_atividade = 'Ativo' where id_medico = 10;

/*Parte 5*/

/*1*/
select *, AVG(valor_consulta) from consulta group by year(data_consulta) = 2020 having id_convenio;


/*2*/
select * from internacao where data_alta > prev_alta;


/*3*/
select * from consulta inner join receita on consulta.id_consulta = receita.id_consulta inner join paciente 
on paciente.id_paciente = consulta.id_paciente 
order by receita.id_receita limit 1;


/*4*/
select *, MAX(valor_consulta), MIN(valor_consulta) from consulta group by id_convenio is null;


/*5*/
select *, DATEDIFF(data_alta, data_entrada) dias_internado, tipo_quarto.valor_diario, DATEDIFF(data_alta, data_entrada) * tipo_quarto.valor_diario valor_total from internacao inner join quarto 
on internacao.id_quarto = quarto.id_quarto inner join tipo_quarto 
on quarto.tipo_id = tipo_quarto.id_tipo;


/*6*/
select i.id_internacao, i.data_entrada, i.procedimento, q.numero from internacao i inner join quarto q 
on q.id_quarto = i.id_quarto where q.tipo_id = 1; 

/*7*/
select p.nome, c.data_consulta, e.id_especialidade from consulta c inner join paciente p 
on p.id_paciente = c.id_paciente inner join especialidade e 
on e.id_especialidade = c.id_especialidade 
where c.id_especialidade <> 1 and year(c.data_consulta) - year(p.data_nascimento) < 19 and year(c.data_consulta) - year(p.data_nascimento) > 0 
order by c.data_consulta ;

/*8*/
select p.nome, m.nome, i.data_entrada, i.procedimento, q.id_quarto
from internacao i
inner join medico m 
on m.id_medico = i.id_medico
inner join paciente p
on p.id_paciente = i.paciente_id
inner join quarto q
on q.id_quarto = i.id_quarto
where q.id_tipo_quarto = 3 and m.id_especialidade = 3;

/*9*/
select m.nome, m.crm, count(c.id_medico) as 'Quantidade de consultas' from medico m inner join consulta c 
on c.id_medico = m.id_medico group by c.id_medico;


/*10*/
select * from medico where nome like '%Gabriel%';


/*11*/
select enf.nome, enf.cre, COUNT(p.id_enfermeiro) as Participacao from enfermeiro enf
inner join internacao p on p.id_enfermeiro = enf.id_enfermeiro group by enf.id_enfermeiro having Participacao > 1;
