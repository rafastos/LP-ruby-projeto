require 'yaml'
require_relative 'turma'

class GerenciadorTurmas
  attr_accessor :turmas

  def initialize(arquivo = 'turmas.yml')
    @arquivo = arquivo
    @turmas = carregar_turmas
  end

  def adicionar_turma(turma)
    if @turmas.any? { |t| t.codigo == turma.codigo }
      puts "Já existe uma turma com este código."
    else
      @turmas << turma
      salvar_turmas
      puts "Nova turma adicionada com sucesso!"
    end
  end

  def remover_turma_por_codigo(codigo)
    turma = @turmas.find { |t| t.codigo == codigo }
    if turma
      @turmas.delete(turma)
      salvar_turmas
      puts "Turma excluída e novo arquivo salvo."
    else
      puts "Turma não encontrada."
    end
  end

  def encontrar_turma_por_nome(nome)
    @turmas.find { |t| t.nome == nome }
  end

  def listar_turmas
    @turmas.each do |turma|
      puts "------------------------------------"
      puts "Turma: #{turma.nome}"
      puts "Código: #{turma.codigo}"
      puts "Professor(a): #{turma.professor}"
      puts "Alunos: #{turma.alunos.join(', ')}"
      puts
    end
  end

  def salvar_turmas
    File.open(@arquivo, 'w') { |f| f.write(YAML.dump(@turmas)) }
  end

  def carregar_turmas
    if File.exist?(@arquivo)
      YAML.load(File.read(@arquivo)) || []
    else
      []
    end
  end
end
