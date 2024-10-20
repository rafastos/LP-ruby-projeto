require_relative 'gerenciador_turmas'
require_relative 'turma'

# Função para exibir o menu principal
def exibir_menu
    puts "\n=== Sistema de Gerenciamento de Turmas ==="
    puts "1. Adicionar nova turma"
    puts "2. Remover turma"
    puts "3. Adicionar aluno a turma"
    puts "4. Remover aluno de uma turma"
    puts "5. Listar todas as turmas"
    puts "0. Sair"
    puts "=========================================="
    print "Escolha uma opção: "
end

# Função para criar uma nova turma
def criar_turma
    print "Nome da turma: "
    nome = gets.chomp
    print "Código da turma: "
    codigo = gets.chomp
    print("Nome do professor: ")
    professor = gets.chomp

    Turma.new(nome, codigo, professor)
end

# Função principal do programa
def main
    # Cria uma instância do gerenciador de turmas
    gerenciador = GerenciadorTurmas.new

    # Loop principal do programa
    loop do
      exibir_menu
      opcao = gets.chomp.to_i

      # Estrutura de controle para as opções do menu
      case opcao
      when 1
        # Adiciona uma nova turma
        turma = criar_turma
        gerenciador.adicionar_turma(turma)
      when 2
        # Remove uma turma pelo código
        print "Digite o código da turma a ser removida: "
        codigo = gets.chomp
        gerenciador.remover_turma_por_codigo(codigo)
      when 3
        # Adiciona um aluno a uma turma
        print "Digite o nome da turma: "
        nome_turma = gets.chomp
        turma = gerenciador.encontrar_turma_por_nome(nome_turma)
        if turma
          print "Digite o nome do aluno: "
          nome_aluno = gets.chomp
          turma.adicionar_aluno(nome_aluno)
          gerenciador.salvar_turmas
          puts "#{nome_aluno} adicionado à turma #{nome_turma} com sucesso!"
        else
          puts "Turma não encontrada."
        end
      when 4
        # Remove um aluno de uma turma
        print "Digite o nome da turma: "
        nome_turma = gets.chomp
        turma = gerenciador.encontrar_turma_por_nome(nome_turma)

        if turma
          print "Digite o nome do aluno a ser removido: "
          nome_aluno = gets.chomp
          turma.remover_aluno(nome_aluno)
          gerenciador.salvar_turmas
          puts "#{nome_aluno} removido da turma #{nome_turma} com sucesso!"
        else
          puts "Turma não encontrada."
        end
      when 5
        # Lista todas as turmas
        gerenciador.listar_turmas
      when 0
        puts "Encerrando o programa..."
        break
      else
        puts "Opção inválida!"
      end
    end
end

main