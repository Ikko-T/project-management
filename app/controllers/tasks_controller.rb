class TasksController < ApplicationController
  protect_from_forgery prepended: true
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = @project.tasks.order(created_at: :desc)
  end

  def new
    @task = @project.new
  end

  def create

  end

  def show
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end
end
