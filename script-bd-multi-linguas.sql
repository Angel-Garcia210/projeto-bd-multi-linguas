CREATE TABLE perfil_estudante (
  id_perfil SERIAL PRIMARY KEY ,
  id_usuario INT NOT NULL ,
  idioma_nativo VARCHAR (10) NOT NULL ,
  idioma_estudo VARCHAR (10) NOT NULL ,
  estilo_vocabulario varchar (255) ,
  modulos_concluidos_acumulados INT ,
  nivel_fluencia_atual VARCHAR (20)
);

SELECT * FROM perfil_estudante

INSERT INTO perfil_estudante (id_usuario, idioma_nativo, idioma_estudo, estilo_vocabulario) 
values (1, 'pt BR', 'en US', 'casual'),(2, 'pt BR', 'es ES', 'formal'),(3, 'en US', 'fr FR', 'academico');

INSERT INTO perfil_estudante (id_usuario, idioma_nativo, idioma_estudo, estilo_vocabulario, modulos_concluidos_acumulados, nivel_fluencia_atual) 
values (4, 'pt BR', 'en US', 'negocios', 5, 'B1'),(5, 'es ES', 'en GB', 'tecnico', 12, 'C1'),(6, 'fr FR', 'it IT', 'conversacao', 0, 'A1');


CREATE TABLE assinatura_vip (
 id_assinatura SERIAL PRIMARY KEY,
 id_usuario INT NOT NULL,
 tipo_plano varchar (10) NOT NULL,
  status varchar (20) NOT NULL,
  cota_semanal_traducoes INT,
  traducoes_usadas_semana INT,
  data_inicio TIMESTAMP,
  data_expiracao TIMESTAMP
);

drop table assinatura_vip;

SELECT * FROM assinatura_vip

 INSERT INTO assinatura_vip (id_usuario, tipo_plano, status) 
VALUES (1, 'gold', 'Acesso liberado');

INSERT INTO assinatura_vip (id_usuario, tipo_plano, status) 
VALUES (2, 'bronze', 'Subindo de nível');


CREATE TABLE escola(
  id_escola SERIAL PRIMARY KEY,
  nome_instituicao varchar(150) not null,
  cnpj             varchar(18),
  email_contato    varchar(100) not null,
  data_cadastro    timestamp

);

SELECT * FROM escola;

INSERT INTO escola (nome_instituicao, cnpj, email_contato) VALUES ('consolata', '123.345.56', 'escola.consolata@gmail.com');

INSERT INTO escola (nome_instituicao, cnpj, email_contato) VALUES ('consolata', '123.345.566', 'cr7.consolata@gmail.com');

INSERT INTO escola (nome_instituicao, cnpj, email_contato) VALUES ('consolata', '098.45.56', 'messi.consolata@gmail.com');


CREATE TABLE usuario (
  id_usuario SERIAL PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL ,
  senha_hash VARCHAR(255) NOT NULL,
  data_nascimento DATE NOT NULL,
  faixa_etaria VARCHAR(255) NOT NULL,
  tipo_perfil  VARCHAR(255) NOT NULL,
  fk_turma INT,
  data_cadastro TIMESTAMP,
  constraint fk_turma foreign key (fk_turma) references turma (id_turma)

);

SELECT * FROM usuario;

INSERT INTO usuario (nome, email, senha_hash, data_nascimento, faixa_etaria, tipo_perfil, fk_turma, data_cadastro) values ('ja', 'j@gmail.com', '12', '2011/05/14', '15', 'es',1, '2026/01/01');

INSERT INTO usuario (nome, email, senha_hash, data_nascimento, faixa_etaria, tipo_perfil, fk_turma, data_cadastro) values ('jat', 'jat@gmail.com', '13', '2011/05/14', '15', 'es',1, '2026/01/01');

INSERT INTO usuario (nome, email, senha_hash, data_nascimento, faixa_etaria, tipo_perfil, fk_turma, data_cadastro) values ('jati', 'jati@gmail.com', '14', '2011/05/14', '15', 'es',2, '2026/01/01');

drop table usuario



CREATE TABLE recomendacao_vocabulario(
  id_recomendacao SERIAL PRIMARY KEY,
  fk_usuario int NOT NULL,
  palavra_expressao varchar(100) NOT NULL,
  traducao varchar(100) NOT NULL,
  frequencia_uso int,
  sugeriada_por_nlp boolean,
  data_ultima_ocorrencia timestamp, 
  constraint fk_usuario foreign key (fk_usuario)references usuario (id_usuario)

);
SELECT * FROM recomendacao_vocabulario;
INSERT INTO recomendacao_vocabulario(fk_usuario, palavra_expressao, traducao) values (2,'TEXTO','MAIS TEXTO');

INSERT INTO recomendacao_vocabulario(fk_usuario, palavra_expressao, traducao) values (3,'TEXTO','MAIS TEXTO');

INSERT INTO recomendacao_vocabulario(fk_usuario, palavra_expressao, traducao) values (1,'TEXTO','MAIS TEXTO');


CREATE TABLE reporte_falha_traducao (
  id_reporte SERIAL PRIMARY KEY,
  fk_usuario         int  NOT NULL,
  texto_original     text NOT NULL,
  traducao_incorreta text NOT NULL,
  carrecao_sugerida  text,
  data_reporte       timestamp,
  constraint fk_usuario foreign key (fk_usuario)references usuario (id_usuario)

);

SELECT * FROM reporte_falha_traducao;

INSERT INTO reporte_falha_traducao(fk_usuario, texto_original, traducao_incorreta) VALUES (1,'textoo','mais textoo')

INSERT INTO reporte_falha_traducao(fk_usuario, texto_original, traducao_incorreta) VALUES (1,'asdfghj','sdfghjkl')

INSERT INTO reporte_falha_traducao(fk_usuario, texto_original, traducao_incorreta) VALUES (1,'texo','ms texo')

drop table reporte_falha_traducao



CREATE TABLE turma (
  id_turma SERIAL PRIMARY KEY,
  fk_escola    int          NOT NULL,
  nome_turma   varchar(100) NOT NULL,
  ano_letivo   int          NOT NULL,
  constraint fk_escola foreign key (fk_escola)references escola (id_escola)

);
SELECT * FROM turma;
INSERT INTO turma(fk_escola, nome_turma, ano_letivo) VALUES (1,'escola','1123456');

INSERT INTO turma(fk_escola, nome_turma, ano_letivo) VALUES (2,'escola','123456739');

INSERT INTO turma(fk_escola, nome_turma, ano_letivo) VALUES (2,'escola','181234');

drop TABLE professor
drop TABLE pessoa
drop TABLE turma



create table sala_chat (
 id_sala INT generated always as identity primary key,
 id_usuario_1 INT not null,
 id_usuario_2 INT not null,
 autorizado_por_responsavel boolean,
 data_criacao timestamp
);
SELECT * FROM sala_chat;

INSERT INTO sala_chat (usuario_1, id_usuario_2, autorizado_por_responsavel, data_criacao) values ('1', '2', )
INSERT INTO sala_chat (usuario_1, id_usuario_2, autorizado_por_responsavel, data_criacao) values ('3', '4', )
INSERT INTO sala_chat (usuario_1, id_usuario_2, autorizado_por_responsavel, data_criacao) values ('30', '31', )
