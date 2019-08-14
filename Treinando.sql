/*Caso o database já exista ele será excluído*/
DROP DATABASE IF EXISTS LISTA3;

/*Criar a base de dados LISTA 3  contendo a  tabela  IMOVEL*/
create database lista3;
use lista3;

	create table imovel (idMovel int primary key not null, 
                         tipo varchar(15), 
                         bairro varchar(30), 
                         preco decimal(8,2), 
                         situacao varchar(10));
                         
/*Cadastrar os dados na tabela  IMOVEL*/                          
insert into imovel values(1, "APARTAMENTO", "COPACABANA", 100000, "DISPONIVEL"),
						  (2, "LOJA", "TIJUCA", 72000, "DISPONIVEL"),
                          (3, "APARTAMENTO", "CENTRO ", 85000, "DISPONIVEL"),
                          (4, "CASA", "COPACABANA", 95000, "VENDIDO"),
                          (5, "LOJA", "TIJUCA", 30000, "VENDIDO"),
                          (6, "APARTAMENTO", "CENTRO ", 91000, "DISPONIVEL"),
                          (7, "CASA", "TIJUCA", 110000, "DISPONIVEL"),
                          (8, "APARTAMENTO", "CENTRO ", 99000, "VENDIDO"),
                          (9, "LOJA", "COPACABANA", 60000, "VENDIDO"),
                          (10, "CASA", "CENTRO ", 87000, "DISPONIVEL");	

/*1)	Listar os dados dos apartamentos disponíveis.*/
select * from imovel where situacao like "disponivel";
/*2)	Listar os dados das casas e das lojas. [duas consultas]*/
select * from imovel where tipo="CASA" or tipo="LOJA";
select * from imovel where tipo in("CASA", "LOJA");
/*3)	Verificar  o preço médio dos imóveis do Centro*/
select avg(preco) from imovel where bairro = "centro";
/*4)	Verificar o preço médio dos imóveis disponíveis*/
select format(avg(preco), 2) from imovel where situacao="disponivel";
/*5)	Listar o tipo e o preço dos imóveis da Tijuca e/ou Centro. [duas consultas]*/
select tipo,preco from imovel where bairro in("tijuca", "centro");
select tipo,preco from imovel where bairro="tijuca" or bairro="centro%";
/*6)	Listar o maior valor de imóvel da agência*/
select max(preco) from imovel;
/*7)	Listar o menor valor de imóvel da agência*/
select min(preco) from imovel;
/*8)	Verificar a soma dos preços  dos imóveis da Tijuca.*/
select sum(preco) from imovel where bairro = "tijuca";
/*9)	Listar o tipo, o bairro e o preço dos imóveis que custem entre 50000 e 80000  [duas consultas]*/
select tipo, bairro, preco from imovel where preco between 50000 and 80000;
select tipo, bairro, preco from imovel where preco > 50000 and preco < 80000;
/*10)	Listar os dados dos imóveis cujo bairro inicie com C*/
select * from imovel where bairro like "C%";

------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*Caso o database já exista ele será excluído*/
DROP DATABASE IF EXISTS LISTA4;

/*Criar a base de dados LISTA 4  contendo a  tabela  LOJA*/
create database lista4;


use lista4;


create table LOJA(
   idLoja int not null primary key,
   nome varchar(30),
   faturamento decimal(8,2),
   cidade varchar(30), 

  dt_inauguracao date);



/*Cadastrar os dados na tabela  LOJA*/  
insert into LOJA values
 (1, 'RENNER', 1800, 'RIO DE JANEIRO', '2018-08-20'),
 (2, 'RENNER', 2000, 'NITEROI', '2018-09-21'),
 (3, 'CEA', 1900, 'RIO DE JANEIRO', '2018-07-22'),
 (4, 'CEA', 2500, 'SÃO PAULO', '2018-08-23'),
 (5, 'CEA', 2800, 'SALVADOR', '2018-09-24'),
 (6, 'LEADER', 1750, 'RIO DE JANEIRO', '2018-08-19'),
 (7, 'LEADER', 1900, 'NITEROI', '2018-07-18'),
 (8, 'LEADER', 2000, 'RIO DE JANEIRO', '2018-07-17'),
 (9, 'RIACHUELO', 8000, 'SÃO PAULO', '2018-09-20'),
 (10, 'RIACHUELO', 1500, 'SALVADOR', '2018-10-21');                  


/*1) Listar todos os dados da tabela LOJA*/

select * from LOJA;


/*2) Listar o somatório do faturamento das lojas.*/

select FORMAT(sum(faturamento), 2) from LOJA;


/*3) Listar o somatório do faturamento das lojas agrupado por cidade.*/

select cidade, FORMAT(sum(faturamento), 2) from LOJA group by cidade;


/*4) Listar a quantidade lojas agrupadas por cidade.*/

select cidade, count(*) from loja group by cidade;


/*5) Listar a quantidade lojas agrupadas por cidade, exceto SALVADOR.*/

select cidade, count(*) from loja group by cidade having cidade <> 'SALVADOR';


/*6) Listar os dados das lojas que iniciam com R*/

select * from loja where nome like "R%";


/*7) Listar os dados das lojas que iniciam com R por ordem de faturamento.*/

select * from loja where nome like "R%" order by faturamento;


/*8) Listar os dados das lojas que iniciam com C por ordem decrescente de data de inauguração.*/

select * from loja where nome like "c%" order by dt_inauguracao desc; 


/*9) Listar os dados das lojas que inauguraram no mês de agosto.*/

select * from loja where month(dt_inauguracao) = 8;


/*10) Listar o maior faturamento dentre as lojas.*/   

select max(faturamento) from loja;  

------------------------------------------------------------------------------------------------------------------------------------------------------------------

create database Revisao1;
use Revisao1;
create table responsavel (cpf int primary key not null, 
                          nome varchar(50), 
                          cidade varchar(20), 
                          data_nasc date);
                          
create table animal (idAnimal int primary key not null, 
                     nome varchar(30), 
                     classe varchar(20), 
                     peso decimal(7,3), 
                     data_nasc date, 
                     cpf_resp int);
                     
create table patologia (idPatologia int, nome varchar(20));

insert into responsavel values (1001001, 'BERNARDO', 'RIO DE JANEIRO', '2000-10-17'), 
                               (2001001, 'PEDRO', 'NITEROI', '1998-01-01'), 
                               (3001001, 'ANA BEATRIZ', 'RIO DE JANEIRO', '2000-07-20'), 
                               (4001001, 'THEO', 'NITEROI', '1980-09-10'), 
                               (5001001, 'GUILHERME', 'SÃO PAULO', '2001-05-20');

insert into animal values (1, 'ALFREDO', 'CANINO', 10.500, '2017-01-19', 1001001),
                          (2, 'GASPAR', 'CANINO', 2.800, '2018-04-20', 2001001),
                          (3, 'AMORA', 'FELINO', 1.700, '2016-05-22', 3001001),
                          (4, 'BOLINHA', 'FELINO', 6.750, '2018-01-23', 4001001),
                          (5, 'BOMBOM', 'CANINO', 25.300, '2017-03-20', 5001001),
                          (6, 'BROTINHO', 'CANINO', 5.800, '2018-04-02', 1001001),
                          (7, 'BOLA DE NEVE', 'FELINO', 2.650, '2016-05-05', 1001001),
                          (8, 'MILONGA', 'FELINO', 3.980, '2015-06-10', 5001001),
                          (9, 'BOB', 'CANINO', 5.700, '2018-04-20', 5001001),
                          (10, 'XSARA', 'CANINO', 3.600, '2017-08-19', 3001001);

insert into patologia values (1, 'NECROSE'),
                             (1, 'NECROSE'),
							 (1, 'NECROSE'),
                             (2,'HIPOPLASIA'),
                             (2, 'HIPOPLASIA'),
                             (3, 'HEMORRAGIA'),
                             (3, 'HEMORRAGIA'),
                             (3, 'HEMORRAGIA'),
                             (4, 'FRATURA'),
                             (4, 'FRATURA');

/*1) Listar todos os dados da tabela RESPONSAVEL.*/
select * from responsavel;
/*2)	Listar todos os dados da tabela RESPONSAVEL em ordem alfabética crescente.*/
select * from responsavel order by nome;
/*3)	Listar todos os dados da tabela ANIMAL.*/
select * from animal;
/*4)	Listar todos os dados da tabela ANIMAL agrupada por responsável.*/
select * from animal group by cpf_resp;
/*5)	Listar a quantidade de RESPONSÁVEIS agrupada por cidade*/
select cidade, count(*) from responsavel group by cidade;
/*6)	Listar todos os dados da tabela ANIMAL ordenado pela data de nascimento.*/
select * from animal order by data_nasc;
/*7)	Listar os animais que nasceram em abril.*/
select * from animal where month(data_nasc) = 4;
/*8)	Listar os responsáveis das cidades RIO DE JANEIRO e NITERÓI. [duas consultas]*/
select * from responsavel where cidade = 'RIO DE JANEIRO' or cidade = 'NITEROI';
select * from responsavel where cidade in('RIO DE JANEIRO', 'NITEROI');
/*9)	Listar a quantidade de animais por responsável.*/
select count(*) from animal;
/*10)	Listar o nome e o peso dos animais com peso superior a 3 kg.*/
select nome, peso from animal where peso > 3;
/*11)	Listar o maior peso dos animais.*/
select max(peso) from animal;
/*12)	Listar o menor peso dos animais.*/
select min(peso) from animal;
/*13)	Listar a média de peso dos animais.*/
select format(avg(peso), 3) from animal;
/*14)	Listar o nome e a classe do animal agrupada por classe.*/
select nome, classe from animal order by classe;
/*15)	Listar o nome e o peso do animal, que iniciem com a letra B.*/
select nome, peso from animal where nome like 'B%';
/*16)	Listar os responsáveis agrupados por cidade, exceto a cidade de SÃO PAULO*/
select * from responsavel group by cidade having cidade <> 'SÃO PAULO'; 
/*17)	Listar os dados das responsáveis que nasceram no ano 2000.*/
select * from responsavel where year(data_nasc) = 2000;
/*18)	Listar os dados dos animais, por ordem alfabética, que tenham peso entre 2 e 4 kg. [duas consultas]*/
select * from animal where peso > 2 and peso < 4 group by nome;
select * from animal where peso between 2 and 4 order by nome;
/*19)	Listar todos os dados de PATOLOGIA.*/
select * from patologia;
/*20)	Listar todos os dados de PATOLOGIA sem registros repetidos.*/
select distinct * from patologia;

------------------------------------------------------------------------------------------------------------------------------------------------------------------

create database lista5;
use lista5;
create table responsavel(cpf integer primary key not null , nome varchar(50), cidade varchar(20));
                         
create table animal(idAnimal integer primary key not null, 
                    nome varchar(30), 
                    classe varchar(20), 
                    peso decimal(7,3), 
                    data_nasc date, 
                    responsavel_CPF integer not null,
                    foreign key(responsavel_CPF) references responsavel(cpf));
                    
create table classe(idClasse integer primary key not null, descricao date);

alter table animal drop column data_nasc;
alter table classe modify descricao varchar(40);
alter table animal modify classe integer;
alter table animal change classe idClasse integer not null;
alter table animal add foreign key(idClasse) references classe(idClasse);

insert into responsavel values(1000, 'JOSEFINA', 'RIO DE JANEIRO'), 
                              (2000, 'PEROLINA', 'NITEROI'), 
                              (3000, 'REGINILDO', 'RIO DE JANEIRO');

insert into classe values(10, 'CANINO'), 
                         (11, 'FELINO'), 
                         (12, 'SUÍNO');

insert into animal values(1, 'BOLA DE NEVE', 11, 14.500, 1000), 
                         (2, 'PESO PENA', 10, 1.350, 2000), 
						 (3, 'EU MORDO', 10, 8.500, 3000), 
                         (4, 'MAU HUMOR', 11, 3.500, 1000);

update animal set responsavel_CPF = 3000 where idAnimal = 2;
update animal set peso = peso + 1;
delete from classe where descricao = 'SUÍNO';
update responsavel set cidade = 'MESQUITA';
update responsavel set cidade = 'SÃO PAULO' where cpf = 2000;

------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* CRIANDO BANCO */
CREATE DATABASE IF NOT EXISTS IMOVEL;
USE IMOVEL;

CREATE TABLE IF NOT EXISTS IMOVEL (
	idIMOVEL INT,
    TIPO VARCHAR(15),
    BAIRRO VARCHAR(30),
    PRECO DECIMAL(8,2),
    SITUACAO VARCHAR(10),
    PRIMARY KEY(idIMOVEL)
);

INSERT INTO IMOVEL VALUES (1, 'APARTAMENTO', 'COPACABANA', 100000, 'DISPONIVEL'),
						(2, 'LOJA', 'TIJUCA', 72000, 'DISPONIVEL'),
                        (3, 'APARTAMENTO', 'CENTRO', 85000, 'DISPONIVEL'),
                        (4, 'CASA', 'COPACABANA', 95000, 'VENDIDO'),
                        (5, 'LOJA', 'TIJUCA', 30000, 'VENDIDO'),
                        (6, 'APARTAMENTO', 'CENTRO', 91000, 'DISPONIVEL'),
                        (7, 'CASA', 'TIJUCA', 110000, 'DISPONIVEL'),
                        (8, 'APARTAMENTO', 'CENTRO', 99000, 'VENDIDO'),
                        (9, 'LOJA', 'COPACABANA', 60000, 'VENDIDO'),
						(10, 'CASA', 'CENTRO', 87000, 'DISPONIVEL');


/* 
	EXECUTANDO EXERCÍCIOS 
	DICA: CTRL + ENTER é o shortcut para cada linha 
*/

CREATE VIEW view_disponivel AS SELECT idIMOVEL, TIPO, BAIRRO FROM IMOVEL; #1
SELECT * FROM view_disponivel; #2
ALTER VIEW view_disponivel AS SELECT idIMOVEL, TIPO, BAIRRO FROM IMOVEL ORDER BY BAIRRO; #3
CREATE VIEW view_qtd AS SELECT COUNT(*) FROM IMOVEL GROUP BY SITUACAO; #4
CREATE INDEX indexSITUACAO ON IMOVEL(SITUACAO); #5
ALTER TABLE IMOVEL ADD RGI VARCHAR(30); #6
CREATE UNIQUE INDEX indexRGI ON IMOVEL(RGI); #7
SET SQL_SAFE_UPDATES = 0;  
UPDATE IMOVEL SET RGI = '0000'; #8      update sempre com Where             
SET SQL_SAFE_UPDATES = 1;				
DROP INDEX indexSITUACAO ON IMOVEL; #9
DROP VIEW view_disponivel; #10


------------------------------------------------------------------------------------------------------------------------------------------------------------------

/* SCRIPT COMPLETO DA LISTA 5 */

create database lista7baselista5;
use lista7baselista5;
create table responsavel(cpf integer primary key not null , nome varchar(50), cidade varchar(20));
                         
create table animal(idAnimal integer primary key not null, 
                    nome varchar(30), 
                    classe varchar(20), 
                    peso decimal(7,3), 
                    data_nasc date, 
                    responsavel_CPF integer not null,
                    foreign key(responsavel_CPF) references responsavel(cpf));
                    
create table classe(idClasse integer primary key not null, descricao date);

alter table animal drop column data_nasc;
alter table classe modify descricao varchar(40);
alter table animal modify classe integer;
alter table animal change classe idClasse integer not null;
alter table animal add foreign key(idClasse) references classe(idClasse);

insert into responsavel values(1000, 'JOSEFINA', 'RIO DE JANEIRO'), 
                              (2000, 'PEROLINA', 'NITEROI'), 
                              (3000, 'REGINILDO', 'RIO DE JANEIRO');

insert into classe values(10, 'CANINO'), 
                         (11, 'FELINO'), 
                         (12, 'SUÍNO');

insert into animal values(1, 'BOLA DE NEVE', 11, 14.500, 1000), 
                         (2, 'PESO PENA', 10, 1.350, 2000), 
						 (3, 'EU MORDO', 10, 8.500, 3000), 
                         (4, 'MAU HUMOR', 11, 3.500, 1000);

update animal set responsavel_CPF = 3000 where idAnimal = 2;
update animal set peso = peso + 1;
delete from classe where descricao = 'SUÍNO';
update responsavel set cidade = 'MESQUITA';
update responsavel set cidade = 'SÃO PAULO' where cpf = 2000;


/* INICIO DAS QUESTOES DA LISTA 7 */                         
/*1*/ select responsavel.nome, animal.nome from responsavel join animal on responsavel.cpf = animal.responsavel_CPF;  

/*2*/ select animal.nome, classe.descricao from classe join animal on classe.idClasse = animal.idClasse order by animal.nome;

/*3*/ select responsavel.nome, responsavel.cidade,animal.nome from responsavel join animal on responsavel.cpf = animal.responsavel_CPF where responsavel.cidade = 'MESQUITA';  
                       
/*4*/ select animal.nome, classe.descricao from animal join classe on animal.idClasse = classe.idClasse where classe.descricao = 'CANINO';

/*5*/ select animal.nome, animal.peso, classe.descricao from animal join classe on animal.idClasse = classe.idClasse where classe.descricao = 'FELINO'; 

/*6*/ insert into classe values (12, 'SUÍNO');

/*7*/ select classe.descricao, animal.nome from classe left join animal on classe.idClasse = animal.idClasse;  

/*8*/ insert into responsavel values(4000, 'LOZILINDO', 'SÃO PAULO');       

/*9*/ select responsavel.nome, animal.nome from responsavel left join animal on responsavel.cpf = animal.responsavel_CPF;

/*10*/ select animal.nome, classe.descricao from animal join classe on animal.idClasse = classe.idClasse where animal.peso > 5;           

/*11*/ create view view_alfabetico as select animal.nome, classe.descricao from animal join classe on animal.idClasse = classe.idClasse;

/*12*/ create view view_ResponsavelAnimal as select responsavel.nome as responsavel, animal.nome as animal from responsavel left join animal on responsavel.cpf = animal.responsavel_CPF;

------------------------------------------------------------------------------------------------------------------------------------------------------------------

drop database if exists relacionamentos;
create database relacionamentos;
use relacionamentos;
create table Cliente (idCliente integer primary key, nome varchar(50));

create table Fisica (idFisica integer primary key, 
                     cpf decimal(11) not null, 
                     foreign key(idFisica) references Cliente(idCliente));

create table Juridica (idJuridica integer primary key, 
                       cnpj decimal(11) not null,
                       foreign key(idJuridica) references Cliente(idCliente));
                       
create table Produto (codigo integer primary key, nome varchar(50) not null);                       

create table Pedido (numero integer primary key, 
                     valor decimal(8,2) not null, 
					 idCliente integer not null, 
                     foreign key(idCliente) references Cliente(idCliente));

create table ProdutoPedido (codProduto integer, 
                            numPedido integer, 
                            primary key(codProduto, numPedido),
                            foreign key(codProduto) references Produto(codigo),
                            foreign key(numPedido) references Pedido(numero));
                            
create table Funcionario (idFuncionario integer primary key, nome varchar(50) not null);

create table Projeto (idProjeto integer primary key, nome varchar(50) not null);    

create table Participa (idFuncionario integer not null, 
                        idProjeto integer not null,
                        primary key(idFuncionario, idProjeto),
                        foreign key(idFuncionario) references Funcionario(idFuncionario), 
                        foreign key(idProjeto) references Projeto(idProjeto));       

create table Maquina (idMaquina integer primary key, nome varchar(50) not null);

 create table Utiliza ( idFuncionario integer not null,
						idProjeto     integer not null,
						idMaquina     integer not null,
						primary key(idFuncionario,idProjeto,idMaquina),
						foreign key (idFuncionario,idProjeto) references  PARTICIPA(idFuncionario,idProjeto),
						foreign key (idMaquina) references MAQUINA(idMaquina));
 
create table Pessoa (idPessoa integer not null primary key, 
                     nome varchar(50) not null, 
                     idConjuge integer null, 
                     foreign key(idConjuge) references Pessoa(idPessoa));
                     
/*Exercicio 1*/
insert into Cliente values(1, 'Jarilene'), 
                          (2, 'Jorilane'), 
                          (3, 'Jureline'), 
                          (4, 'Construir Ltda'), 
                          (5, 'Derrubar SA'), 
                          (6, 'Reconstruir ME');
                          
insert into Fisica values(1, 02102102121), (2, 02202202222), (3, 02202202222);

insert into Juridica values(4, 88888880001), (5, 99999990001), (6, 77777770001);

/*Exercicio 2*/
insert into Produto values(1, 'LÁPIS'), 
                          (2, 'CADERNO'), 
                          (3, 'CANETA'), 
                          (4, 'LIVRO'), 
                          (5, 'BORRACHA');
                          
insert into Pedido values(101, 300.50, 1), 
                         (102, 480.00, 2), 
                         (103, 430.00, 3);
                         
insert into ProdutoPedido values (1, 101), 
                                 (1, 102), 
                                 (2, 101), 
                                 (2, 102), 
                                 (2, 103), 
                                 (4, 102), 
                                 (5, 102), 
                                 (5, 103);                         
                
/*Exercicio 3*/     
insert into funcionario values(1, 'JAMES'), (2, 'JANE'), (3, 'JONES');
insert into projeto values(1, 'SEGURADORA'), (2, 'ACADEMIA'), (3, 'NAVAL');
insert into Maquina values(1, 'NOTEBOOK'), (2, 'IMPRESSORA');
insert into Participa(idFuncionario, idProjeto) values(1,1);
insert into Participa(idFuncionario, idProjeto) values(1,2);
insert into Participa(idFuncionario, idProjeto) values(2,2);
insert into Participa(idFuncionario, idProjeto) values(3,2);
insert into Participa(idFuncionario, idProjeto) values(3,3);
insert into Utiliza(idFuncionario,idProjeto,idMaquina) values (1,1,1);
insert into Utiliza(idFuncionario,idProjeto,idMaquina) values (1,1,2);
insert into Utiliza(idFuncionario,idProjeto,idMaquina) values (1,2,2);
insert into Utiliza(idFuncionario,idProjeto,idMaquina) values (2,2,1);
insert into Utiliza(idFuncionario,idProjeto,idMaquina) values (3,2,1);
insert into Utiliza(idFuncionario,idProjeto,idMaquina) values (3,3,1);
insert into Utiliza(idFuncionario,idProjeto,idMaquina) values (3,3,2);

/*Exercicio 4*/  
insert into Pessoa values (1, 'João',null);
insert into Pessoa values (2, 'Jupira', 1);
insert into Pessoa values (3, 'Idalir',null);
insert into Pessoa values (4, 'Juca',null);
insert into Pessoa values (5, 'Inajar',null); 
insert into Pessoa value  (6, 'Inari', 5);
insert into Pessoa values (7, 'Joelma',null); 
insert into Pessoa values (8, 'Idalane',null); 
insert into Pessoa values (9, 'Jupiri', 8);

------------------------------------------------------------------------------------------------------------------------------------------------------------------

create database lista8;
use lista8;

create table autor
(
     idAutor int primary key not null, 
     nome varchar(50)
);

create table musica
(
	idMusica int primary key not null, 
    nome varchar(30), 
    ano decimal(4)
);

create table disco
(
	idDisco int primary key not null, 
    titulo varchar(30)
);

create table autor_musica
(
	idAutor int not null, 
    idMusica int not null, 
	primary key(idAutor, idMusica), 
    foreign key(idAutor) references autor(idAutor), 
    foreign key(idMusica) references musica(idMusica)
);

create table musica_disco
(
	idMusica int not null,
    idDisco int not null, 
	primary key(idMusica, idDisco), 
    foreign key(idMusica) references musica(idMusica), 
    foreign key(idDisco) references disco(idDisco)
);

insert into autor values(1, 'Roberto Carlos');
insert into autor values(2, 'Erasmo Carlos');
insert into autor values(3, 'Justin Bieber');

insert into musica values(1, 'Caminhoneiro', 1980);
insert into musica values(2, 'Amigo', 1990);
insert into musica values(3, 'Baby', 2010);

insert into disco values(1, 'Jovem Guarda');
insert into disco values(2, 'My World');

insert into autor_musica values(1, 1);
insert into autor_musica values(2, 1);
insert into autor_musica values(1, 2);
insert into autor_musica values(3, 3);

insert into musica_disco values(1, 1);
insert into musica_disco values(2, 1);
insert into musica_disco values(3, 2);

/*1*/
select autor.nome as autor, musica.nome as musica from autor join autor_musica on autor.idAutor = autor_musica.idAutor 
                                                             join musica       on autor_musica.idMusica = musica.idMusica 
                                                             where musica.nome = 'Amigo';
/*2*/
select autor.nome as autor, musica.nome as musica, disco.titulo as disco from autor join autor_musica on autor.idAutor = autor_musica.idAutor 
                                                                                    join musica on autor_musica.idMusica = musica.idMusica 
                                                                                    join musica_disco on musica.idMusica = musica_disco.idMusica 
                                                                                    join disco on musica_disco.idDisco = disco.idDisco 
                                                                                    where musica.nome = 'Baby';

/*3*/
select musica.nome as musica, disco.titulo as disco from disco join musica_disco on disco.idDisco = musica_disco.idDisco 
                                                               join musica on musica_disco.idMusica = musica.idMusica;

/*4*/
select musica.nome as musica, autor.nome as autor from musica join autor_musica on musica.idMusica = autor_musica.idMusica
                                                              join autor on autor_musica.idAutor = autor.idAutor 
                                                              where autor.nome = 'Roberto Carlos';

/*5*/
select disco.titulo as disco, autor.nome as autor from disco join musica_disco on disco.idDisco = musica_disco.idDisco
                                                             join musica on musica_disco.idMusica = musica.idMusica
                                                             join autor_musica on musica.idMusica = autor_musica.idMusica
                                                             join autor on autor_musica.idAutor = autor.idAutor 
                                                             where autor.nome = 'Justin Bieber';

/*6*/
select musica.ano as ano, musica.nome as musica, autor.nome as nome from musica join autor_musica on musica.idMusica = autor_musica.idMusica
                                                                                join autor on autor_musica.idAutor = autor.idAutor 
                                                                                where musica.ano < 2000;
																				
																				------------------------------------------------------------------------------------------------------------------------------------------------------------------
																				
drop database if exists Revisao2;

create database Revisao2;
use Revisao2;


create table CATEGORIA(idCategoria	integer not null primary key,
					   descricao	varchar(30),
                       ativa		varchar(3));

create table DISCO(idDisco  	integer not null primary key,
				   titulo		varchar(40),
                   ano 			decimal(4),
                   preco		decimal(6,2),
                   idCategoria	integer not null,
                   foreign key (idCategoria) references Categoria(idCategoria));

insert into CATEGORIA values(1, "POP", "S"),
							(2, "ROCK", "S"),
							(3, "ROMÂNTICA", "N"),
							(4, "INSTRUMENTAL", "S"),
							(5, "AXÉ", "N");

insert into DISCO values(1,"Lemonade - Beyonce", 2016, 38.00,1),
						(2,"Dark Side of The Moon - Pink Floyd", 1973, 52.00,2),
                        (3,"Love Songs", 2010, 45.00, 3),
                        (4,"Shades of Blue", 2003, 37.00, 4),
                        (5,"O melhor do Axé", 2016, 18.00,5),
                        (6,"Thriller - Michael Jackson", 1982, 29.00,1),
                        (7,"Ray of Light - Madonna", 1998, 59.00, 1),
                        (8,"Nevermind - Nirvana", 1991, 37.00, 2),
                        (9,"Tommy - The Who", 1969, 98.00, 2),
                        (10,"The Best of Kenny G", 2018, 31.00, 4);

/*1*/ select count(*) from CATEGORIA where ativa="S";
/*2*/ select format(avg(preco),2) from DISCO;
/*3*/ create view view_disco as select titulo,ano from DISCO;
/*4*/ select titulo,preco from DISCO order by titulo;
/*5*/ select max(preco) from DISCO;
/*6*/ select * from DISCO where preco between 30 and 60;
/*7*/ select * from DISCO where titulo like "T%";
/*8*/ select idCategoria,count(*) from DISCO group by idCategoria;
/*9*/ select ativa,count(*) from CATEGORIA group by ativa;
/*10*/ select * from CATEGORIA where descricao like "P%";
/*11*/ select * from CATEGORIA where ativa="S";
/*12*/ create unique index idx_CATEGORIA_nome on CATEGORIA (descricao);
/*13*/ insert into CATEGORIA values(6, "ROCK", "S");
/*14*/ alter table DISCO add column gravadora varchar(30);
/*15*/ update DISCO set gravadora="SONY MUSIC";
/*16*/ update DISCO set gravadora="ROCK MUSIC" where idCategoria=2;
/*17*/ select titulo,preco from DISCO;
/*18*/ update DISCO set preco= preco*1.15;
/*19*/ delete from DISCO where idCategoria = 5;
/*20*/ create index idx_DISCO_ANO on DISCO(ano);
/*21*/ drop index idx_CATEGORIA_nome on CATEGORIA;
/*22*/ alter table DISCO modify titulo varchar(50);

/*23*/ create table PREMIO(idPremio integer not null primary key,
						   nome		varchar(30));
                           
/*24*/ insert into PREMIO values(1, "MTV MUSIC"),
								(2, "GRAMMY");
                                
/*25*/ alter table DISCO add column idPremio integer null;
/*26*/ alter table DISCO add foreign key (idPremio) references PREMIO(idPremio);
/*27*/ update DISCO set idPremio="1" where idDisco in(2,4);
/*28*/ update DISCO set idPremio="2" where idDisco="7" or idDisco="8" or idDisco="9";
/*29*/ select idPremio,count(*) from DISCO group by idPremio;
/*30*/ alter table DISCO drop column preco;