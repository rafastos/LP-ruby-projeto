require 'yaml'
require_relative 'turma'

# Define a classe GerenciadorTurmas
class GerenciadorTurmas
  # Define acessores para o atributo turmas
  attr_accessor :turmas

  # Método construtor
  def initialize(arquivo = 'turmas.yml')
    @arquivo = arquivo
    @turmas = carregar_turmas
  end

  # Método para adicionar uma nova turma
  def adicionar_turma(turma)
    # Verifica se já existe uma turma com o mesmo código
    if @turmas.any? { |t| t.codigo == turma.codigo }
      puts "Já existe uma turma com este código."
    else
      # Adiciona a turma, salva e exibe mensagem de sucesso
      @turmas << turma
      salvar_turmas
      puts "Nova turma adicionada com sucesso!"
    end
  end

  # Método para remover uma turma pelo código
  def remover_turma_por_codigo(codigo)
    # Procura a turma pelo código
    turma = @turmas.find { |t| t.codigo == codigo }
    if turma
      # Remove a turma, salva as alterações e exibe mensagem
      @turmas.delete(turma)
      salvar_turmas
      puts "Turma excluída e novo arquivo salvo."
    else
      puts "Turma não encontrada."
    end
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
      puts "Alunos: #{turma.alunos.join(', ')}"
      puts
    end
  end

  # Método para salvas as turmas no arquivo YAML
  def salvar_turmas
    File.open(@arquivo, 'w') { |f| f.write(YAML.dump(@turmas)) }
  end

  # Método para carregar as turmas do arquivo YAML
  def carregar_turmas
    if File.exist?(@arquivo)
      # Carrega as turmas do arquivo, permitindo a classe Turma
      YAML.safe_load(File.read(@arquivo), permitted_classes: [Turma])
    else
      # Retorna um vetor vazio se o arquivo não existir
      []
    end
  rescue => e
    # Em caso de erro, exibe a mensagem e inicia com lista vazia
    puts "Erro ao carregar o arquivo: #{e.message}"
    puts "Iniciando com lista vazia..."
    []
  end
end
