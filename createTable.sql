CREATE TABLE aluno (
    nome VARCHAR(255) NOT NULL,
    cpf BIGINT NOT NULL,
    ra BIGINT NOT NULL,
    email VARCHAR(255) NOT NULL,
    fone VARCHAR(20) NOT NULL
)

CREATE TABLE uc (
    carga_horaria BIGINT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    id BIGINT NOT NULL,
    descricao VARCHAR(255),
    ra_aluno PK,
    id_professor PK 
)

CREATE TABLE plano_curricular (
    id BIGINT NOT NULL,
    descricao VARCHAR(255),
    id_uc FK
)

CREATE TABLE professor (
    id BIGINT NOT NULL,
    cpf BIGINT NOT NULL,
    nome VARCHAR(255),
    fone VARCHAR(20),
    email VARCHAR(55),
    data_contratacao TIMESTAMP NOT NULL,
)

CREATE TABLE turma (
    id BIGINT NOT NULL,
    turno VARCHAR(50),
    dia_aula VARCHAR(30),
    id_uc PK,
    id_salas PK,
    id_professor PK,
    id_aluno PK
)

CREATE TABLE campus (
    id BIGINT NOT NULL,
    nome VARCHAR(50) NOT NULL
)

CREATE TABLE sala (
    id BIGINT NOT NULL,
    capacidade INT NOT NULL,
    id_predios PK
) 

CREATE TABLE predio (
    id BIGINT NOT NULL,
    numero_salas_aula INT NOT NULL,
    id_campus PK
)

CREATE TABLE matricula (
    id_aluno PK,
    id_turma PK,
    data_efetuacao TIMESTAMP,
    data_cancelamento TIMESTAMP,
    situacao BOOLEAN
)

CREATE TABLE conteudo_curricular (
    id BIGINT NOT NULL,
    descricao VARCHAR(255)
    
)

CREATE TABLE plano_conteudo (
    id_planoCurricular PK
    id_conteudoCurricular PK
)

ALTER TABLE alunos ADD PRIMARY KEY(ra);

ALTER TABLE uc ADD PRIMARY KEY(id);
ALTER TABLE uc ADD FOREIGN KEY(ra_aluno) REFERENCES aluno(ra);
ALTER TABLE uc ADD FOREIGN KEY(id_professor) REFERENCES professor(id);


ALTER TABLE plano_curricular ADD PRIMARY KEY(id);
ALTER TABLE plano_curricular ADD FOREIGN KEY(id_uc) REFERENCES uc(id);

ALTER TABLE professor ADD PRIMARY KEY(id);

ALTER TABLE turma
