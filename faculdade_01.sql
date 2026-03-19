create schema faculdade;

use faculdade;

create table alunos (
id int auto_increment primary key,
nome varchar(100) not null,
cpf varchar(14) not null,
email varchar(100) not null unique,
data_nascimento date not null,
data_matricula date not null,
ativo boolean not null default true
);

describe disciplinas;

create table professores (
id int auto_increment primary key,
nome varchar(100) not null,
cpf varchar(14) not null unique,
titulacao enum('graduacao', 'especializacao', 'mestrado', 'doutorado') not null,
ativo boolean not null default true
);

create table disciplinas (
id int auto_increment primary key,
codigo varchar (10) not null,
nome varchar (100) not null,
carga_horaria int not null,
ementa TEXT
);

create table turma (
id int auto_increment primary key,
disciplina_id int not null,
professor_id int not null,
semestre varchar (6) not null,
foreign key (disciplina_id) references disciplinas(id),
foreign key (professor_id) references professores(id)
);

create table matriculas (
id int auto_increment primary key,
aluno_id int not null,
turma_id int not null,
data_matricula date not null default (current_date),
status enum('ativa','trancada','cancelada') not null default 'ativa',
foreign key (aluno_id) references alunos(id),
foreign key (turma_id) references turma(id)
);

create table notas (
id int auto_increment primary key,
matricula_id int not null,
avaliacao varchar(30) not null,
nota decimal(4,2) not null check(nota >= 0 and nota <= 10),
data_lancamento date not null default (current_date),
foreign key (matricula_id) references matriculas(id)
);

create table presencas (
id int auto_increment primary key,
matricula_id int not null,
data_aula date not null,
presente boolean not null default true,
foreign key (matricula_id) references matriculas(id)
);

