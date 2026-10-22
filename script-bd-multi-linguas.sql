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


CREATE TABLE assinatura_vip (
 id_assinatura SERIAL PRIMARY KEY,
 id_usuario INT NOT NULL,
 tipo_plano varchar (10) NOT NULL,
  status varchar (255) NOT NULL,
  cota_semanal_traducoes INT,
  traducoes_usadas_semana INT,
  data_inicio TIMESTAMP,
  data_expiracao TIMESTAMP
);

drop table assinatura_vip;

    SELECT * FROM assinatura_vip

INSERT INTO assinatura_vip (tipo_plano, status)
     values ('gold', 'Acesso liberado ao que há de melhor');

INSERT INTO assinatura_vip (tipo_plano, status)
     values ('bronze', 'Subindo de nível. O extraordinário agora faz parte da minha rotina');
