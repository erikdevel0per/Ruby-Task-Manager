
# Gerenciador de Tarefas (Ruby)

## Descrição
Este código é um gerenciador de tarefas simples que permite ao usuário adicionar, listar, marcar como concluídas e excluir tarefas. Ele também mantém um arquivo de texto persistente (`tasks.txt`) para salvar e carregar as tarefas.

## Linguagem e Tipos de Código
- **Linguagem:** O código foi escrito em **Ruby**

O código é dividido em duas classes principais (`Task` e `TaskManager`), além de uma função que gerencia a interação com o usuário. Vamos analisar cada parte:

## Classe `Task`:
A classe Task representa uma tarefa individual e tem dois atributos principais:

- `description`: a descrição da tarefa.
- `completed`: um valor booleano (true ou false) que indica se a tarefa foi concluída.

Métodos:
- `initialize(description, completed = false`): O construtor inicializa a descrição da tarefa e define o status como não concluída (padrão é `false`).

- `mark_completed`: Este método altera o status da tarefa para concluída, definindo o atributo `@completed` como `true`.

- `to_s`: Este método sobrescreve o método `to_s` de Ruby, permitindo representar a tarefa como uma `string`. Ele exibe a descrição da tarefa e seu status, se está "Concluída" ou "Pendente", dependendo do valor de `@completed`.

## Classe `TaskManager`:
A classe `TaskManager` gerencia uma lista de tarefas e também interage com um arquivo de texto para salvar e carregar as tarefas.

Atributos:
- `@file_name`: O nome do arquivo onde as tarefas são salvas (por padrão, `"tasks.txt"`).
- `@tasks`: Uma lista (`array`) que contém os objetos `Task`.

Métodos:
- `initialize(file_name = "tasks.txt"`): O construtor recebe o nome do arquivo (com valor padrão `"tasks.txt"`) e chama o método `load_tasks` para carregar as tarefas do arquivo.

- `add_task(description)`: Este método cria uma nova tarefa com a descrição fornecida, adiciona à lista de tarefas e então salva as tarefas no arquivo de texto.

- `list_tasks`: Exibe todas as tarefas salvas. Se não houver tarefas, ele informa que não há tarefas.

- `mark_task_completed(index)`: Este método recebe um índice de tarefa, marca a tarefa correspondente como concluída, e então atualiza o arquivo de tarefas.

- `delete_task(index)`: Exclui a tarefa no índice especificado e depois atualiza o arquivo de tarefas.

Métodos Privados:
- `load_tasks`: Este método carrega as tarefas do arquivo especificado. Ele lê cada linha do arquivo e cria um objeto `Task` para cada linha. A linha é dividida em dois valores (descrição e status de conclusão) usando o separador `|`.

- `save_tasks`: Este método salva todas as tarefas no arquivo de texto. Cada tarefa é salva em uma linha, com a descrição e o status da tarefa separados por |.

## Função `start_task_manager`:
Esta função é responsável por interagir com o usuário. Ela cria uma instância de `TaskManager` e exibe um menu para que o usuário escolha as ações que deseja realizar. O loop continua até que o usuário escolha sair.

Opções do Menu:
- **Adicionar Tarefa**: Solicita uma descrição e adiciona uma nova tarefa.
- **Listar Tarefas**: Exibe todas as tarefas atuais.
- **Marcar Tarefa como Concluída**: Solicita o número da tarefa e a marca como concluída.
- **Excluir Tarefa**: Solicita o número da tarefa e a exclui.
- **Sair**: Finaliza o programa.

Fluxo de Execução:
- O usuário pode interagir com o programa através do terminal. Quando o programa é iniciado, ele apresenta o menu.
- Dependendo da escolha do usuário, o programa executa a ação correspondente: adicionar, listar, concluir, excluir tarefas ou sair.
- A lista de tarefas é salva no arquivo de texto a cada modificação, o que garante persistência de dados entre execuções do programa.

## Características de Ruby no Código:

- Sintaxe simples e expressiva: Ruby é uma linguagem de fácil leitura e escrita, o que permite a criação rápida de protótipos como este.
- Orientação a objetos: O código utiliza classes e objetos (`Task` e `TaskManager`), que são os pilares da orientação a objetos em Ruby.
- Métodos de instância e variáveis de instância: O uso de métodos como `initialize`, `to_s`, e o acesso a variáveis de instância (`@description`, `@completed`) é típico em Ruby.
- Manipulação de arquivos: O código usa métodos de leitura e escrita de arquivos (`File.readlines` e `File.open`) para carregar e salvar as tarefas.

## Resumo das Funções:
- **Adicionar tarefa**: Cria uma nova tarefa e a salva no arquivo.
- **Listar tarefas**: Exibe todas as tarefas com seu status atual.
- **Marcar tarefa como concluída**: Altera o status de uma tarefa específica para "concluída" e salva.
- **Excluir tarefa**: Remove uma tarefa da lista e salva as mudanças.
- **Persistência em arquivo**: As tarefas são salvas em um arquivo de texto para persistência de dados entre execuções do programa.

## **Muito Obrigado pela sua atenção!**
