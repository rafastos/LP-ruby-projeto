class Aluno
    attr_accessor :nome, :notas

     # Método construtor
    def initialize(nome)
        @nome = nome
        @notas = []
    end

    # Método para adicionar uma nota ao aluno
    def adicionar_nota(nota)
        @notas << nota
    end

     # Método para remover uma nota do aluno
    def remover_nota(nota)
        @notas.delete(nota)
    end
    
    # Método para calcular a média das notas do aluno
    def calcular_media
        return 0 if @notas.empty?
        @notas.sum / @notas.size.to_f
    end
end