CREATE TABLE aluno (
    nome VARCHAR(255) NOT NULL,
    cpf BIGINT NOT NULL,
    ra BIGINT NOT NULL,
    email VARCHAR(255) NOT NULL,
    fone VARCHAR(20) NOT NULL
);

CREATE TABLE uc (
    carga_horaria BIGINT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    id BIGINT NOT NULL,
    descricao VARCHAR(255),
    ra_aluno BIGINT NOT NULL,
    id_professor BIGINT NOT NULL 
);

CREATE TABLE plano_curricular (
    id BIGINT NOT NULL,
    descricao VARCHAR(255),
    id_uc BIGINT NOT NULL
);

CREATE TABLE professor (
    id BIGINT NOT NULL,
    cpf BIGINT NOT NULL,
    nome VARCHAR(255),
    fone VARCHAR(20),
    email VARCHAR(55),
    data_contratacao TIMESTAMP NOT NULL,
);

CREATE TABLE turma (
    id BIGINT NOT NULL,
    turno VARCHAR(50),
    dia_aula VARCHAR(30),
    id_uc BIGINT NOT NULL,
    id_sala BIGINT NOT NULL,
    id_professor BIGINT NOT NULL,
    id_aluno BIGINT NOT NULL
);

CREATE TABLE campus (
    id BIGINT NOT NULL,
    nome VARCHAR(50) NOT NULL
)

CREATE TABLE sala (
    id BIGINT NOT NULL,
    capacidade INT NOT NULL,
    id_predio BIGINT NOT NULL
);

CREATE TABLE predio (
    id BIGINT NOT NULL,
    numero_salas_aula INT NOT NULL,
    id_campus BIGINT NOT NULL
);

CREATE TABLE matricula (
    id_aluno BIGINT NOT NULL,
    id_turma BIGINT NOT NULL,
    data_efetuacao TIMESTAMP,
    data_cancelamento TIMESTAMP,
    situacao BOOLEAN
);

CREATE TABLE conteudo_curricular (
    id BIGINT NOT NULL,
    descricao VARCHAR(255)   
);

CREATE TABLE plano_conteudo (
    id_planoCurricular BIGINT NOT NULL,
    id_conteudoCurricular BIGINT NOT NULL
);

ALTER TABLE alunos ADD PRIMARY KEY(ra);

ALTER TABLE uc ADD PRIMARY KEY(id);
ALTER TABLE uc ADD FOREIGN KEY(ra_aluno) REFERENCES aluno(ra);
ALTER TABLE uc ADD FOREIGN KEY(id_professor) REFERENCES professor(id);


ALTER TABLE plano_curricular ADD PRIMARY KEY(id);
ALTER TABLE plano_curricular ADD FOREIGN KEY(id_uc) REFERENCES uc(id);

ALTER TABLE professor ADD PRIMARY KEY(id);

ALTER TABLE turma ADD PRIMARY KEY(id);
ALTER TABLE turma ADD FOREIGN KEY(id_uc) REFERENCES uc(id);
ALTER TABLE turma ADD FOREIGN KEY(id_sala) REFERENCES sala(id);
ALTER TABLE turma ADD FOREIGN KEY(id_professor) REFERENCES professor(id);
ALTER TABLE turma ADD FOREIGN KEY(id_aluno) REFERENCES aluno(id);

ALTER TABLE campus ADD PRIMARY KEY(id);

ALTER TABLE sala ADD PRIMARY KEY(id);
ALTER TABLE sala ADD FOREIGN KEY(id_predio) REFERENCES predio(id);

ALTER TABLE matricula ADD FOREIGN KEY (id_aluno) REFERENCES aluno(id);
ALTER TABLE matricula ADD FOREIGN KEY (id_turma) REFERENCES turma(id);

ALTER TABLE conteudo_curricular ADD PRIMARY KEY(id);

ALTER TABLE plano_conteudo ADD FOREIGN KEY(id_planoCurricular) REFERENCES plano_curricular(id);
ALTER TABLE plano_conteudo ADD FOREIGN KEY(id_conteudoCurricular) REFERENCES conteudo_curricular(id);


