require 'yaml'
require_relative 'turma'
require_relative 'aluno'

class GerenciadorTurmas
  attr_accessor :turmas, :alunos

  # Método construtor
  def initialize(arquivo_turmas = 'turmas.yml', arquivo_alunos = 'alunos.yml')
    @arquivo_turmas = arquivo_turmas
    @arquivo_alunos = arquivo_alunos
    @turmas = carregar_turmas
    @alunos = carregar_alunos
  end

  # Método para adicionar uma nova turma
  def adicionar_turma(turma)
    if @turmas.any? { |t| t.codigo == turma.codigo }
      puts "Já existe uma turma com este código."
    else
      @turmas << turma
      salvar_turmas
      puts "Nova turma adicionada com sucesso!"
    end
  end

  # Método para remover uma turma pelo código
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

  # Método para encontrar um aluno pelo nome
  def encontrar_aluno_por_nome(nome_aluno)
    @alunos.find { |a| a.nome == nome_aluno }
  end

  # Método para encontrar uma turma pelo nome
  def encontrar_turma_por_nome(nome)
    @turmas.find { |t| t.nome == nome }
  end

  # Método para listar todas as turmas
  def listar_turmas
    @turmas.each do |turma|
      puts "------------------------------------"
      puts "Turma: #{turma.nome}"
      puts "Código: #{turma.codigo}"
      puts "Professor(a): #{turma.professor}"
      puts "Alunos:"
      turma.alunos.each do |aluno|
        puts "Notas de #{aluno.nome}: #{aluno.notas.inspect}"
        media = aluno.calcular_media
        puts "  - #{aluno.nome} (Média: #{media.round(2)})"
      end
      puts
    end
  end

  # Método para salvar as turmas no arquivo YAML
  def salvar_turmas
    File.open(@arquivo_turmas, 'w') { |f| f.write(YAML.dump(@turmas)) }
  end

  # Método para carregar as turmas do arquivo YAML
  def carregar_turmas
    if File.exist?(@arquivo_turmas)
      YAML.safe_load(File.read(@arquivo_turmas), permitted_classes: [Turma, Aluno])
    else
      []
    end
  rescue => e
    puts "Erro ao carregar o arquivo: #{e.message}"
    puts "Iniciando com lista vazia..."
    []
  end

  # Método para salvar os alunos no arquivo YAML
  def salvar_alunos
    File.open(@arquivo_alunos, 'w') { |f| f.write(YAML.dump(@alunos)) }
  end

  # Método para carregar os alunos do arquivo YAML
  def carregar_alunos
    if File.exist?(@arquivo_alunos)
      YAML.safe_load(File.read(@arquivo_alunos), permitted_classes: [Aluno])
    else
      []
    end
  rescue => e
    puts "Erro ao carregar o arquivo: #{e.message}"
    puts "Iniciando com lista vazia..."
    []
  end

  def cadastrar_aluno(aluno)
    if @alunos.any? { |a| a.nome == aluno.nome }
      puts "Já existe um aluno com este nome."
    else
      @alunos << aluno
      salvar_alunos
      puts "Aluno #{aluno.nome} cadastrado com sucesso!"
    end
  end
end