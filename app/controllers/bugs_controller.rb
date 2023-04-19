class BugsController < ApplicationController
  def index
    @bugs = current_user.qa_bugs
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def edit
    @bug = Bug.find(params[:id])
  end

  def destroy
  end

  def new
    @bug = Bug.new
    @project = Project.find(params[:project_id])

    print :@c_project
    print @project
    print :@c_project
  end

  def create
    print :params
    print params[:project_id]
    # @bug.update(:project_id => @bug.project_id + bug_params[:project_id].to_i)

    @bug = Bug.new(update_params)
    @project = Project.find(project_params[:project_id])
    print @project
    # @project
    # binding.pry
    @bug.projects_id = @project_id
    @bug.qa_id = current_user.id
    # @bug = Bug.new(bug_params)
    if @bug.save
      redirect_to bug_path(@bug)
    else
      render 'index'
    end
  end

  def update
    if @bug.update(update_params)
      redirect_to bug_path(@bug)
    else
      render 'new'
    end
  end

  def bug_params
    params.require(:bug).permit(:title, :description, :bug_type, :deadline, :status, :screenshot, :project_id)
  end

  def project_params
    params.require(:bug).permit(:project_id)
  end

  def update_params
    params.permit(:title, :description, :bug_type, :deadline, :status, :screenshot, :project_id)
  end
end
