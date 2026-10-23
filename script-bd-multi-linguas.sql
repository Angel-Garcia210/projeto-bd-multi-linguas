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
