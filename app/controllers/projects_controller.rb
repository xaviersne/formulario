class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_params)
    project.save

    redirect_to root_path
  end

  def index
    @selected_state = 'All'
    if params[:state].present? && params[:state] != 'All'
      @selected_state = params[:state]
      @projects = Project.where('state = ?', params[:state])
    else
    @projects = Project.all
    end
  end
  private
  def project_params
    params.require(:project).permit(:name, :description, :state, :starts_on, :ends_on)    
  end
end
