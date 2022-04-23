class ProjectsController < ApplicationController
  before_action :set_project, only: [:edit, :update, :show, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Projeto criado com sucesso."
      redirect_to @project
     else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Projeto Atualizado com sucesso."
      redirect_to @project
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    if @project.destroy
      flash[:notice] = "Projeto Excluído com sucesso."
      redirect_to projects_path
    else
      render projects_path
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    parameters = params.require(:project).permit(:nome, :descricao, :github_url, :status_id)
  end
end