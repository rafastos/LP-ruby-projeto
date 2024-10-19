require_relative 'gerenciador_turmas'
require_relative 'turma'

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

def criar_turma
    print "Nome da turma: "
    nome = gets.chomp
    print "Código da turma: "
    codigo = gets.chomp
    print("Nome do professor: ")
    professor = gets.chomp

    Turma.new(nome, codigo, professor)
end

def main
    gerenciador = GerenciadorTurmas.new

    loop do
      exibir_menu
      opcao = gets.chomp.to_i

      case opcao
      when 1
        turma = criar_turma
        gerenciador.adicionar_turma(turma)
      when 2
        print "Digite o código da turma a ser removida: "
        codigo = gets.chomp
        gerenciador.remover_turma_por_codigo(codigo)
      when 3
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