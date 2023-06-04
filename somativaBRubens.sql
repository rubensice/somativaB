
create table status(
id bigint not null auto_increment,
situacao varchar(100),
primary key(id)
);

insert into status (situacao) values 
('aberta'),('Em andamento'),('Concluida'),('Encerrada');

drop table tarefa;
create table tarefa(
id bigint not null auto_increment,
descricao varchar(300) not null,
prazo date,
localFK bigint not null,
solicitanteFK bigint not null,
primary key(id),
foreign key(solicitanteFK) references usuarios(id),
foreign key(localFK) references locais(id)
);
select * from usuarios;

insert into tarefa (descricao, localFK, solicitanteFK) values
('consertar porta emperrada', '3', '1'),
('consertar ar-condicionado', '2', '2'),
('solucionar máquina sem internet', '3', '2'),
('repor material de escritório', '3', '6'),
('comprar novas cadeiras', '4', '6');

insert into tarefa (descricao, localFK, solicitanteFK) values
('trocar cabo hdmi defeituoso', '5', '1'),
('consertar vazamento de graxa', '8', '5'),
('solucionar máquina sem internet', '5', '2'),
('repor material de escritório', '8', '6'),
('comprar novas cadeiras', '11', '6');

insert into tarefa (descricao, localFK, solicitanteFK) values
('trocar cabo de rede', '5', '1'),
('consertar saída de de ar p equipamentos pneumaticos', '8', '1');

select * from locais;

select * from usuarios;
drop table progresso;
create table progresso(
id bigint not null auto_increment,
tarefaFK bigint not null,
statusFK bigint not null,
comentario varchar(350),
responsavelFK bigint not null,
data datetime not null default now(),
foto varchar(350),
primary key(id),
foreign key(responsavelFK) references usuarios(id),
foreign key(tarefaFK) references tarefa(id),
foreign key(statusFK) references status(id)
);

select * from tarefa;
select * from ocupacao;
select * from usuarios;
insert into progresso (tarefaFK, statusFK, comentario, responsavelFK) values 

('1','1','tarefa a iniciar','11'),
('1','1','tarefa a iniciar','6'),
('1','1','tarefa a iniciar','3');

insert into progresso (tarefaFK, statusFK, comentario, responsavelFK) values
('3','1','tarefa a iniciar','11'),
('4','1','tarefa a iniciar','6'),
('5','1','tarefa a iniciar','3'), 
('6','2','estamos seguindo','3'),
('7','2','Ok, está sendo acompanhando','2'),
('8','3','Ok, resolvido','11'),
('9','3','Ok, já resolvido','6'),
('10','4','finalizado','3');

insert into progresso (tarefaFK, statusFK, comentario, responsavelFK) values
('11','1','tarefa a iniciar','11'),
('12','1','tarefa a iniciar','6');


alter table usuarios
add column telefone varchar(15),
add column fotoPerfil varchar(350);








insert into nivelAcesso (nivel) values 
('ADMIN'),('GESTOR'),('USUARIO'),('VISITANTE');
select *from nivelAcesso;


insert into ocupacao (titulo, nivelAcessoFK) values 
('Professor', 3),('Secretária', 3),('Coordenador', 2),('Orientador', 2),
('Aluno', 4),('Analista de Sistemas', 1),('Diretor', 1);

select *from ocupacao;



insert into usuarios (nome, email, dataNascimento, senha, ocupacaoFK) values 
('João', 'joao@gmail.com', '2000-01-01', 'dsdknoidn393943', 5),
('Maria', 'maria@gmail.com', '2002-05-11', 'dsdkner4553', 2),
('Clara', 'clara@gmail.com', '1999-01-01', 'wewer3434', 5),
('Roberto', 'roberto@gmail.com', '1998-12-01', '3434343ref', 1),
('Carlos', 'carlos@gmail.com', '1995-01-01', '343refefe', 6),
('Alex', 'alex@gmail.com', '2004-01-11', '448ffjfff', 2),
('José', 'jose@gmail.com', '1985-01-01', '4488fjjf', 5);


insert into usuarios (nome, email, dataNascimento, senha, ocupacaoFK) values 
('Jéssica', 'jessica@gmail.com', '1997-01-01', 'ahhfhhff', 4);

select *from usuarios;



insert into item (nome) values 
('Projetor'),('Tablet'),('Ar condicionado'),('Monitor'),('TV Smart'),('Som');


insert into locais (nome, lotacao, bloco) values 
('Laboratório Eletrônica 01', 16, 'A'),
('Laboratório Informática 02', 30, 'C'),
('Laboratório Metalmecânica', 16, 'B'),
('Auditório', 100, 'A'),
('Laboratório Eletrônica 02', 16, 'A'),
('Laboratório Ensaios Mecânicos', 32, 'D');



insert into checkList(localFK, itemFK) values
(1,2),(1,5),(1,6),(1,3),
(2,1),(2,2),
(3,3),(3,4),(3,5),
(4,1),(4,3),(4,5),(4,6);



select *from locais;

insert into eventos (nome, localFk, inicio, fim, inicioCheckin, fimCheckIn, vagas)
values
('Workshop Cloud Básico', 2, '2023-05-26 18:45:00', '2023-05-26 23:45:00', '2023-05-26 18:45:00', '2023-05-26 23:45:00', 30), 
('Workshop Desenho SolidWorks', 3, '2023-06-26 18:45:00', '2023-06-26 23:45:00', '2023-06-01 18:45:00', '2023-06-01 23:45:00', 16),
('Blockchain Básico', 1, '2023-08-12 18:45:00', '2023-08-15 23:45:00', '2023-05-26 18:45:00', '2023-05-26 23:45:00', 0),
('Decolando sua carreira', 4, '2023-12-12 18:45:00', '2023-12-12 23:45:00', '2023-08-26 18:45:00', '2023-08-26 23:45:00', 59),
('Desmistificando Spring Framework', 1, '2024-01-26 18:45:00', '2024-01-30 23:45:00', '2024-01-01 18:45:00', '2024-01-01 23:45:00', 16),
('Criptomoedas e Web3', 1, '2023-05-30 18:45:00', '2023-05-30 23:45:00', '2023-05-30 18:45:00', '2023-05-30 23:45:00', 10);




insert into checkIn (eventoFK, usuarioFK, data) values 
(1,2,now()),
(1,1,'2023-01-01 00:00:00'),
(1,5,now()),
(2,6,now()),
(2,4,now()),
(3,1,'2023-05-05 00:00:00'),
(3,2,now()),
(3,4,now()),
(3,6,'2023-08-08 00:00:00'),
(4,1,now()),
(4,4,now()),(4,6,now());


insert into checkIn (eventoFK, usuarioFK, data) values 
(7,2,now());

-- Crie uma consulta que mostre todas as tarefas iniciadas com as informações de seus respectivos envolvidos no processo;

SELECT t.descricao, u1.nome AS solicitante, u2.nome AS responsavel
FROM tarefa AS t
JOIN progresso AS p ON p.tarefaFK = t.id
JOIN usuarios AS u1 ON t.solicitanteFK = u1.id
JOIN usuarios AS u2 ON p.responsavelFK = u2.id
order by t.descricao;

-- Crie uma consulta que mostre todos os locais que tiveram associação a mais de duas tarefas;

select t.localFK, l.nome, count(*) totalTarefas from tarefa t
join locais l on l.id = t.localFK
group by t.localFK
having totalTarefas > 2;


-- Crie uma consulta que mostre todos os usuários que tiveram associação a duas tarefas no mínimo;

select t.solicitanteFK, u1.nome, p.responsavelFK, u2.nome, count(*) totalTarefas from tarefa t
JOIN progresso AS p ON p.tarefaFK = t.id
JOIN usuarios AS u1 ON t.solicitanteFK = u1.id
JOIN usuarios AS u2 ON p.responsavelFK = u2.id
group by t.solicitanteFK, p.responsavelFK
having totalTarefas >= 2;



-- Crie uma consulta que mostre todos eventos que ainda acontecerão e as tarefas que ainda não foram executadas nos locais destes eventos
-- (essa consulta ajudará a gestão visualizar se há algum problema que pode impactar os eventos);
select s.situacao, t.descricao, e.nome, l.nome
from tarefa t
join locais l
on t.localFK = l.id
join eventos e
on e.localFK = l.id
join progresso p
on t.id = p.tarefaFK
join status s
on p.statusFK = s.id
where s.situacao != "Concluída" and e.inicio > now();



-- Crie uma consulta que mostre os locais e a quantidade de tarefas existentes (independente do status);

select l.nome, count(*) totalTarefas from tarefa t
join locais l
on l.id = t.localFK
group by l.nome;

-- Crie uma consulta que mostre os locais e a quantidade de tarefas concluídas;

select l.nome, count(*) totalTarefas from tarefa t
join locais l
on l.id = t.localFK
join progresso p
on t.id = p.tarefaFK
join status s
on p.statusFK = s.id
where s.situacao = 'Concluida'
group by l.nome;




-- Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuídas (independente dos tatus);

select p.responsavelFK, u.nome, count(*) totalTarefas from tarefa t
join progresso p
on p.tarefaFK = t.id
join usuarios u
on p.responsavelFK = u.id
group by p.responsavelFK;

-- Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuídas a serem feitas;

select p.responsavelFK, u.nome, count(*) totalTarefas from tarefa t
join progresso p
on p.tarefaFK = t.id
join status s
on s.id = p.statusFK
join usuarios u
on p.responsavelFK = u.id
where s.situacao != 'Concluida' or 'Finalizada'
group by p.responsavelFK;



-- Crie uma consulta que mostre a média por mês de quantas tarefas são criadas por local;

select l.nome, count(*) totalTarefas from tarefa t
join locais l
on t.localFK = l.id
group by l.nome;

SELECT l.nome, YEAR(t.dataAbert) AS ano, MONTH(t.dataAbert) AS mes, AVG(contagem) AS media_mensal
FROM ( select l.id local, l.nome nomeLocal, count(*) as contagem
       from tarefas t
       join local l on l.id = t.localFK
       group by t.id) subconsulta GROUP BY YEAR(t.dataAbert), MONTH(t.dataAbert);


SELECT l.nome, YEAR(t.abertura) AS ano, MONTH(t.abertura) AS mes, AVG(contagem) AS media_mensal
FROM ( select l.id local, l.nome nomeLocal, count(*) as contagem
       from tarefas t
       join local l on l.id = t.localFK
       group by t.id) subconsulta GROUP BY YEAR(t.abertura), MONTH(t.abertura);

SELECT AVG(contagem) AS media_quantidade_vendas
FROM (
    SELECT COUNT(*) AS contagem
    FROM vendas
    GROUP BY id_venda
) subconsulta

