class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_task
  before_action :set_project

  def index
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post atualizado com sucesso"
      @project = @task.project
      redirect_to project_task_path(@project, @task)
    else
      render 'edit'
    end
  end

  def create
    @post = Post.new(post_params)
    @post.task = @task

    if @post.save
      flash[:notice] = "Post Criado com sucesso."
      @project = @task.project
      redirect_to project_task_path(@project, @task)
    else
      render 'new'
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = "Post excluído com sucesso."
      redirect_to project_task_path(@project, @task)
    else
      render 'index'
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def post_params
    params.require(:post).permit(:titulo, :texto)
  end
end