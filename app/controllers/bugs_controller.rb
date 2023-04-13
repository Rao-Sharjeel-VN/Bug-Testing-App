class BugsController < ApplicationController
  
  
  def index  
    @current_project = Project.find(params[:project_id])
    @bugs = @current_project.bugs.all
  end

  def show

  end

  def edit

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
    @bug = Bug.new(bug_params)
    @project = Project.find(params[:bug][:project_id])
    @bug.project = @project
    @bug.qa = current_user
    # @bug = Bug.new(bug_params)
    
    
    if @bug.save
      redirect_to bug_path(@bug)
    else
      render 'new'
    end
  end

  

  def bug_params
    params.require(:bug).permit(:title, :description, :bug_type, :deadline, :status, :screenshot, :dev_id, :qa_id)
  end


end
