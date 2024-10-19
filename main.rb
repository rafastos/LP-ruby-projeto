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
    print("Nomr do professor: ")
    professor = gets.chomp

    Turma.new(nome, codigo, professor)
end