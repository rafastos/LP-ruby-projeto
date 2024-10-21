require 'yaml'
require_relative 'aluno'

# Define a classe Turma
class Turma
  # Define acessores para os atributos nome, codigo, professor e alunos
  attr_accessor :nome, :codigo, :professor, :alunos

  # Método construtor
  def initialize(nome, codigo, professor)
    @nome = nome
    @codigo = codigo
    @professor = professor
    @alunos = [] # Inicia a lista de alunos como um array vazio
  end

  # Método para adicionar um aluno à turma
  def adicionar_aluno(aluno)
    # Adiciona o aluno apenas se ele ainda não estiver na lista
    @alunos << aluno unless @alunos.any? { |a| a.nome == aluno.nome }
  end

  # Método para remover um aluno da turma
  def remover_aluno(nome_aluno)
    @alunos.reject! { |a| a.nome == nome_aluno }
  end
end
