CREATE TABLE escola (
    id_escola SERIAL PRIMARY KEY,
    nome_instituicao VARCHAR(150) NOT NULL,
    cnpj VARCHAR(18),
    email_contato VARCHAR(100) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE turma (
    id_turma SERIAL PRIMARY KEY,
    fk_escola INT NOT NULL,
    nome_turma VARCHAR(100) NOT NULL,
    ano_letivo INT NOT NULL,
    CONSTRAINT fk_escola FOREIGN KEY (fk_escola) REFERENCES escola (id_escola) ON DELETE CASCADE
);

CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    data_nascimento DATE NOT NULL,
    faixa_etaria VARCHAR(255) NOT NULL,
    tipo_perfil VARCHAR(255) NOT NULL,
    fk_turma INT,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_turma FOREIGN KEY (fk_turma) REFERENCES turma (id_turma) ON DELETE SET NULL
);

CREATE TABLE perfil_estudante (
    id_perfil SERIAL PRIMARY KEY,
    fk_usuario INT NOT NULL,
    idioma_nativo VARCHAR(10) NOT NULL,
    idioma_estudo VARCHAR(10) NOT NULL,
    estilo_vocabulario VARCHAR(255),
    modulos_concluidos_acumulados INT DEFAULT 0,
    nivel_fluencia_atual VARCHAR(20),
    CONSTRAINT fk_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE
);

CREATE TABLE recomendacao_vocabulario (
    id_recomendacao SERIAL PRIMARY KEY,
    fk_usuario INT NOT NULL,
    palavra_expressao VARCHAR(100) NOT NULL,
    traducao VARCHAR(100) NOT NULL,
    frequencia_uso INT DEFAULT 0,
    sugeriada_por_nlp BOOLEAN DEFAULT FALSE,
    data_ultima_ocorrencia TIMESTAMP,
    CONSTRAINT fk_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE
);

CREATE TABLE reporte_falha_traducao (
    id_reporte SERIAL PRIMARY KEY,
    fk_usuario INT NOT NULL,
    texto_original TEXT NOT NULL,
    traducao_incorreta TEXT NOT NULL,
    carrecao_sugerida TEXT,
    data_reporte TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE
);

CREATE TABLE sala_chat (
    id_sala INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    fk_usuario_1 INT NOT NULL,
    fk_usuario_2 INT NOT NULL,
    autorizado_por_responsavel BOOLEAN DEFAULT FALSE,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario_01 FOREIGN KEY (fk_usuario_1) REFERENCES usuario (id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_usuario_02 FOREIGN KEY (fk_usuario_2) REFERENCES usuario (id_usuario) ON DELETE CASCADE
);

CREATE TABLE mensagem_chat (
    id_mensagem SERIAL PRIMARY KEY,
    fk_sala INT NOT NULL,
    fk_usuario INT NOT NULL,
    texto_original TEXT NOT NULL,
    texto_traduzido TEXT,
    idioma_origem VARCHAR(10) NOT NULL,
    idioma_destino VARCHAR(10) NOT NULL,
    comtem_conteudo_inapropriado BOOLEAN DEFAULT FALSE,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_sala FOREIGN KEY (fk_sala) REFERENCES sala_chat (id_sala) ON DELETE CASCADE,
    CONSTRAINT fk_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE
);

CREATE TABLE assinatura_vip (
    id_assinatura SERIAL PRIMARY KEY,
    fk_usuario INT NOT NULL,
    tipo_plano VARCHAR(10) NOT NULL,
    status VARCHAR(20) NOT NULL,
    cota_semanal_traducoes INT DEFAULT 0,
    traducoes_usadas_semana INT DEFAULT 0,
    data_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    data_expiracao TIMESTAMP,
    CONSTRAINT fk_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE
);

CREATE TABLE avaliacao_nivel (
    id_avaliacao SERIAL PRIMARY KEY,
    fk_usuario INT NOT NULL,
    pontuacao_obtida DECIMAL(5,2) NOT NULL,
    nivel_resultante VARCHAR(20) NOT NULL,
    eh_reavaliacao_obrigatoria BOOLEAN DEFAULT FALSE,
    data_realizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE
);

CREATE TABLE progresso_aprendizado (
    id_progresso SERIAL PRIMARY KEY,
    fk_usuario INT NOT NULL,
    fk_avaliacao INT NOT NULL,
    minutos_praticados INT NOT NULL,
    licoes_concluidas INT NOT NULL,
    data_registro DATE NOT NULL,
    CONSTRAINT fk_usuario FOREIGN KEY (fk_usuario) REFERENCES usuario (id_usuario) ON DELETE CASCADE,
    CONSTRAINT fk_avaliacao FOREIGN KEY (fk_avaliacao) REFERENCES avaliacao_nivel (id_avaliacao) ON DELETE CASCADE
);

INSERT INTO escola (nome_instituicao, cnpj, email_contato) VALUES 
('consolata', '123.345.56', 'escola.consolata@gmail.com'),
('consolata', '123.345.566', 'cr7.consolata@gmail.com'),
('consolata', '098.45.56', 'messi.consolata@gmail.com');

INSERT INTO turma (fk_escola, nome_turma, ano_letivo) VALUES 
(1, 'escola', 2026),
(2, 'escola', 2026),
(2, 'escola', 2026);

INSERT INTO usuario (nome, email, senha_hash, data_nascimento, faixa_etaria, tipo_perfil, fk_turma, data_cadastro) VALUES 
('ja', 'j@gmail.com', '12', '2011-05-14', '15', 'es', 1, '2026-01-01 00:00:00'),
('jat', 'jat@gmail.com', '13', '2011-05-14', '15', 'es', 1, '2026-01-01 00:00:00'),
('jati', 'jati@gmail.com', '14', '2011-05-14', '15', 'es', 2, '2026-01-01 00:00:00');

INSERT INTO perfil_estudante (fk_usuario, idioma_nativo, idioma_estudo) VALUES 
(1, 'formal', 'academico'),
(2, 'formal', 'academico'),
(3, 'formal', 'academico');

INSERT INTO recomendacao_vocabulario (fk_usuario, palavra_expressao, traducao) VALUES 
(2, 'TEXTO', 'MAIS TEXTO'),
(3, 'TEXTO', 'MAIS TEXTO'),
(1, 'TEXTO', 'MAIS TEXTO');

INSERT INTO reporte_falha_traducao (fk_usuario, texto_original, traducao_incorreta) VALUES 
(1, 'textoo', 'mais textoo'),
(1, 'asdfghj', 'sdfghjkl'),
(1, 'texo', 'ms texo');

INSERT INTO sala_chat (fk_usuario_1, fk_usuario_2) VALUES 
(1, 2),
(3, 2),
(3, 1);

INSERT INTO mensagem_chat (fk_sala, fk_usuario, texto_original, idioma_origem, idioma_destino) VALUES 
(1, 1, 'oscuro', 'espanhol', 'ingles');

INSERT INTO assinatura_vip (fk_usuario, tipo_plano, status) VALUES 
(1, 'gold', 'Acesso liberado'),
(2, 'bronze', 'Subindo de nível'),
(3, 'bronze', 'Subindo de nível');

INSERT INTO avaliacao_nivel (fk_usuario, pontuacao_obtida, nivel_resultante, data_realizacao) VALUES 
(1, 7.5, '17', '2001-11-09 00:00:00'),
(2, 0.3, '17', '2001-11-09 00:00:00'),
(3, 5.0, '17', '2001-12-09 00:00:00');

INSERT INTO progresso_aprendizado (fk_usuario, fk_avaliacao, minutos_praticados, licoes_concluidas, data_registro) VALUES 
(1, 1, 59, 5, '2021-09-01'),
(1, 1, 43, 4, '2021-10-02'),
(1, 1, 12, 2, '2021-09-21');
