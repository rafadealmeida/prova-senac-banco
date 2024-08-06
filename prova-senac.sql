CREATE DATABASE provaBanco;

USE	provaBanco;

CREATE TABLE aluno (
    id INTEGER PRIMARY KEY NOT NULL auto_increment,
    ra VARCHAR(8) NOT NULL,
    tempoestudo integer NOT NULL,
    rendafamiliar DECIMAL(8,2),
    UNIQUE (ra, id)
);
CREATE TABLE diarioBordo (
    id INTEGER PRIMARY KEY UNIQUE auto_increment NOT NULL,
    texto text NOT NULL,
    datahora DATETIME NOT NULL,
    fk_aluno_id INTEGER NOT NULL
);
 
ALTER TABLE diarioBordo ADD CONSTRAINT FK_diarioBordo_2
    FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno (id)
    ON DELETE CASCADE;
    
select* FROM aluno;
select* FROM diarioBordo;

describe diarioBordo;
     
insert aluno(ra,tempoestudo,rendafamiliar) values('43434343',2,1500.00),('43436767',1,2500.00),('43556767',5,1000.00),('14436767',1,2000.00),('43499767',1,5500.00);

insert diarioBordo (texto,datahora,fk_aluno_id) values ('sql script', '2024-08-02 18:00:00','1'),('sql script', '2024-08-02 12:00:00','2'),
('sql script', '2024-08-02 20:00:00','3'),('sql script', '2024-08-02 20:30:00','4'),
('sql script', '2024-08-02 22:00:00','5'),('sql script', '2024-08-02 09:00:00','3');

select aluno.ra as registro_aluno ,
diarioBordo.texto as anotacao , 
diarioBordo.datahora,
aluno.tempoestudo as tempo_de_estudo, 
aluno.rendafamiliar 
from diarioBordo join aluno on diarioBordo.fk_aluno_id = aluno.id;

