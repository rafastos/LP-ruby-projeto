require 'yaml'

class Turma
  attr_accessor :nome, :codigo, :professor, :alunos

  def initialize(nome, codigo, professor)
    @nome = nome
    @codigo = codigo
    @professor = professor
    @alunos = [] # Lista de nomes dos alunos
  end

  def adicionar_aluno(nome_aluno)
    @alunos << nome_aluno unless @alunos.include?(nome_aluno)
  end

  def remover_aluno(nome_aluno)
    @alunos.delete(nome_aluno)
  end
end
