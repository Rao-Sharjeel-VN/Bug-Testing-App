class BuggsController < ApplicationController
  before_action :set_bugg, only: %i[show edit update destroy]
  load_and_authorize_resource

  # GET /buggs or /buggs.json
  def index
    @buggs = Bugg.where(qa_id: current_user.id)
  end

  # GET /buggs/1 or /buggs/1.json
  def show
  end

  # GET /buggs/new
  def new
    @bugg = Bugg.new
    @project = Project.find(params[:project_id])
  end

  # GET /buggs/1/edit
  def edit
  end

  # POST /buggs or /buggs.json
  def create
    @bugg = Bugg.new(bugg_params)
    @project = Project.find(bugg_params[:project_id].to_i)
    @bugg.project = @project
    @bugg.qa = current_user

    respond_to do |format|
      if @bugg.save
        format.html { redirect_to bugg_url(@bugg), notice: "Bugg was successfully created." }
        format.json { render :show, status: :created, location: @bugg }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bugg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buggs/1 or /buggs/1.json
  def update
    respond_to do |format|
      if @bugg.update(bugg_params)
        format.html { redirect_to bugg_url(@bugg), notice: "Bugg was successfully updated." }
        format.json { render :show, status: :ok, location: @bugg }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bugg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buggs/1 or /buggs/1.json
  def destroy
    @bugg.destroy

    respond_to do |format|
      format.html { redirect_to buggs_url, notice: "Bugg was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bugg
    @bugg = Bugg.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def bugg_params
    params.require(:bugg).permit(:title, :description, :bugg_type, :deadline, :status, :screenshot, :project_id)
  end
end
