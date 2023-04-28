class ProjectsController < ApplicationController
  
  before_action :set_project, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[index show edit update destroy]
  load_and_authorize_resource

  # GET /projects or /projects.json
  def index
    if current_user.user_type == 0
      @pagy, @projects = pagy(current_user.projects.with_deleted, page: params[:page], items: 3)
    end
    if current_user.user_type == 1
      @pagy, @projects = pagy(current_user.assigned_projects, page: params[:page], items: 3)
    end
    if current_user.user_type == 2
      @pagy, @projects = pagy(current_user.assigned_projects, page: params[:page], items: 3)
    end
  end

  # GET /projects/1 or /projects/1.json
  def show
    print "Test message from projects/show"
    authorize! :read, @project
  rescue CanCan::AccessDenied
    redirect_to projects_path
  end

  # GET /projects/new
  def new
    @project = Project.new
    @manager_check = check_manager
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = current_user.projects.create(project_params_new)
    @errorMessage = []
    print('@projec')
    print(@project)
    respond_to do |format|
      if @project.save
        @project.update(project_params)
        format.js
        # format.html {	render :show }
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        print("1111111111111111111111111111111111111111111111111")
        format.js
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        @project.errors.each do |key, value|
          @errorMessage.push
        end
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
        format.js   { render :layout => false }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
        format.js   { render :layout => false }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name, :user_id, user_ids: [])
  end

  def project_params_new
    params.require(:project).permit(:name, :user_id)
  end

  def check_manager
    return current_user.user_type == 0
  end



end
