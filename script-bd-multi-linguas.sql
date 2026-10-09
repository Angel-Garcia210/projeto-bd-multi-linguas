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

INSERT INTO perfil_estudante (id_perfil) values ('casual', 'formal', 'academico') ;
