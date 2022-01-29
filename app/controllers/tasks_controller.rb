class TasksController < ApplicationController
  protect_from_forgery prepended: true
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_task, only: %i[show edit update destroy]

  def create
    @task = @project.tasks.build(task_params)

    if @task.save
      redirect_to project_path(@project), notice: "Task was successfully created."
    else
      flash.now[:alert] = "Task was NOT created!"
      render "projects/show"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to project_path(@project), notice: "Task was successfully updated."
    else
      flash.now[:alert] = "Task was NOT updated!"
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to project_path(@project), notice: "Task was successfully deleted."
  end

  private

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status, :project_id)
  end
end
