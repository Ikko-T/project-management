class ProjectsController < ApplicationController
  protect_from_forgery prepended: true
  before_action :authenticate_user!
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @projects = current_user.projects.order(id: :desc)
  end

  def new
    @project = current_user.projects.build
  end

  def create
    @project = current_user.projects.build(project_params)

    if @project.save
      redirect_to @project, notice: "Project was successfully created."
    else
      flash.now[:alert] = "Project was NOT created!"
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: "Project was successfully updated."
    else
      flash.now[:alert] = "Project was NOT updated!"
      render :edit
    end
  end

  def destroy
    @project.destroy!
    redirect_to projects_path, notice: "Project was successfully deleted."
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
