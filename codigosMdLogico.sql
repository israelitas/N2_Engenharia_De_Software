@startuml
class Aluno {
  - nome: String
  - cpf: long
  - ra: long (PK)
  - email: String
  - fone: String
}

class UC {
  - cargaHoraria: long
  - nome: String
  - id: long (PK)
  - descricao: String
  - raAluno: long
  - idProfessor: long
}

class PlanoCurricular {
  - id: long (PK)
  - descricao: String
  - idUC: long
}

class Professor {
  - id: long (PK)
  - cpf: long
  - nome: String
  - fone: String
  - email: String
  - dataContratacao: Date
}

class Turma {
  - id: long (PK)
  - turno: String
  - diaAula: String
  - idUC: long
  - idSala: long
  - idProfessor: long
  - idAluno: long
}

class Campus {
  - id: long (PK)
  - nome: String
}

class Sala {
  - id: long (PK)
  - capacidade: int
  - idPredio: long
}

class Predio {
  - id: long (PK)
  - numeroSalasAula: int
  - idCampus: long
}

class Matricula {
  - idAluno: long
  - idTurma: long
  - dataEfetuacao: Date
  - dataCancelamento: Date
  - situacao: boolean
}

class ConteudoCurricular {
  - id: long (PK)
  - descricao: String
}

class PlanoConteudo {
  - idPlanoCurricular: long
  - idConteudoCurricular: long
}

Aluno "1" -- "n" Matricula
UC "1" -- "n" PlanoCurricular
UC "1" -- "n" Turma
Turma "1" -- "n" Professor
Sala "1" -- "n" Turma
Predio "1" -- "n" Sala
Predio "1" -- "1" Campus
Matricula "n" -- "1" Turma
PlanoConteudo "1" -- "n" PlanoCurricular
PlanoConteudo "1" -- "n" ConteudoCurricular
@enduml