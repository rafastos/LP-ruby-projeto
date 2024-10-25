# LP-ruby-projeto
Projeto apresentado como quesito de avaliação da matéria de Linguagens de Programação

Aqui está um exemplo de README para seu projeto de gerenciamento de turmas e alunos em Ruby:

---

# Sistema de Gerenciamento de Turmas e Alunos

Este é um sistema de gerenciamento de turmas e alunos, desenvolvido em Ruby, que permite adicionar, remover, listar turmas e alunos e também calcular a média das notas dos alunos. Este projeto é ideal para acompanhar a evolução acadêmica de alunos em várias turmas.

## Funcionalidades

- **Cadastrar Turmas**: Adicione novas turmas ao sistema, incluindo informações como nome, código e professor.
- **Cadastrar Alunos**: Insira novos alunos e suas notas, podendo associá-los a diferentes turmas.
- **Adicionar ou Remover Alunos de Turmas**: Gerencie os alunos em cada turma.
- **Calcular a Média das Notas de Cada Aluno**: Veja o desempenho dos alunos de maneira individual.
- **Listar Todas as Turmas**: Visualize uma lista completa de todas as turmas e seus alunos, com as notas e médias.

## Estrutura do Projeto

O projeto é dividido em quatro arquivos principais:

1. **aluno.rb**: Classe `Aluno` que representa um aluno e armazena suas notas.
2. **turma.rb**: Classe `Turma` que contém informações sobre uma turma e uma lista de alunos.
3. **gerenciador_turmas.rb**: Classe `GerenciadorTurmas` para gerenciar turmas e alunos, incluindo armazenamento de dados em arquivos YAML.
4. **main.rb**: Arquivo principal que exibe o menu e as funcionalidades interativas do sistema.

## Tecnologias Utilizadas

- **Ruby**: Linguagem principal do projeto.
- **YAML**: Para persistência de dados.

## Pré-requisitos

- **Ruby**: Certifique-se de ter o Ruby instalado. [Instalação do Ruby](https://www.ruby-lang.org/pt/documentation/installation/).
- **YAML**: Utilizado para salvar e carregar dados das turmas e alunos.

## Executando o Projeto

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu_usuario/nome_do_repositorio.git
   cd nome_do_repositorio
   ```

2. Execute o programa principal:
   ```bash
   ruby main.rb
   ```

3. Siga o menu de opções para gerenciar turmas e alunos.

## Menu de Opções

- `1. Adicionar nova turma`: Cria uma nova turma com nome, código e professor.
- `2. Remover turma`: Remove uma turma pelo código.
- `3. Adicionar aluno a turma`: Adiciona um aluno previamente cadastrado a uma turma.
- `4. Remover aluno de uma turma`: Remove um aluno da turma.
- `5. Listar todas as turmas`: Exibe todas as turmas com suas informações.
- `6. Cadastrar novo aluno`: Cadastra um novo aluno com suas notas.
- `0. Sair`: Encerra o programa.

## Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para fazer um fork do projeto e enviar pull requests.

## Licença

Este projeto é de uso livre e aberto para contribuições.
