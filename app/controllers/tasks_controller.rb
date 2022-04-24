class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_project

  def index
    @tasks = @project.task
  end

  def show
  end

  def create
    @task = Task.new(task_params)
    @task.project = @project
    if @task.save
      flash[:notice] = "Tarefa criada com sucesso."
      redirect_to project_task_path(@project, @task)
    else
      render 'new'
    end
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Tarefa atualizada com sucesso."
      redirect_to project_task_path(@project, @task)
    else
      render 'edit'
    end
  end

  def destroy
    if @task.destroy
      flash[:notice] = "Tarefa Excluída com sucesso."
      redirect_to project_path(@project)
    else
      render 'index'
    end
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    parameters = params.require(:task).permit(:nome, :status_id, :descricao, :commit_hash)
  end
end