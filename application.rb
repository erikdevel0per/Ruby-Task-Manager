# Gerenciador de Tarefas com Salvamento em Arquivo e Exclusão

class Task
    attr_accessor :description, :completed
  
    def initialize(description, completed = false)
      @description = description
      @completed = completed
    end
  
    def mark_completed
      @completed = true
    end
  
    def to_s
      status = @completed ? "Concluída" : "Pendente"
      "#{@description} - #{status}"
    end
  end
  
  class TaskManager
    def initialize(file_name = "tasks.txt")
      @file_name = file_name
      @tasks = load_tasks
    end
  
    def add_task(description)
      task = Task.new(description)
      @tasks << task
      save_tasks
      puts "Tarefa '#{description}' adicionada!"
    end
  
    def list_tasks
      if @tasks.empty?
        puts "Não há tarefas!"
      else
        puts "Lista de Tarefas:"
        @tasks.each_with_index do |task, index|
          puts "#{index + 1}. #{task}"
        end
      end
    end
  
    def mark_task_completed(index)
      if index >= 1 && index <= @tasks.length
        @tasks[index - 1].mark_completed
        save_tasks
        puts "Tarefa #{index} marcada como concluída!"
      else
        puts "Índice de tarefa inválido!"
      end
    end
  
    def delete_task(index)
      if index >= 1 && index <= @tasks.length
        removed_task = @tasks.delete_at(index - 1)
        save_tasks
        puts "Tarefa '#{removed_task.description}' excluída!"
      else
        puts "Índice de tarefa inválido!"
      end
    end
  
    private
  
    def load_tasks
      tasks = []
      if File.exist?(@file_name)
        File.readlines(@file_name).each do |line|
          description, completed = line.chomp.split("|")
          tasks << Task.new(description, completed == "true")
        end
      end
      tasks
    end
  
    def save_tasks
      File.open(@file_name, "w") do |file|
        @tasks.each do |task|
          file.puts("#{task.description}|#{task.completed}")
        end
      end
    end
  end
  
  # Função para interagir com o usuário
  def start_task_manager
    manager = TaskManager.new
  
    loop do
      puts "\nEscolha uma opção:"
      puts "1. Adicionar tarefa"
      puts "2. Listar tarefas"
      puts "3. Marcar tarefa como concluída"
      puts "4. Excluir tarefa"
      puts "5. Sair"
  
      choice = gets.chomp.to_i
  
      case choice
      when 1
        print "Digite a descrição da tarefa: "
        description = gets.chomp
        manager.add_task(description)
      when 2
        manager.list_tasks
      when 3
        print "Digite o número da tarefa a ser concluída: "
        index = gets.chomp.to_i
        manager.mark_task_completed(index)
      when 4
        print "Digite o número da tarefa a ser excluída: "
        index = gets.chomp.to_i
        manager.delete_task(index)
      when 5
        puts "Saindo..."
        break
      else
        puts "Opção inválida!"
      end
    end
  end
  
  # Iniciar o gerenciador de tarefas
  start_task_manager
  