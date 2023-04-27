class BuggsController < ApplicationController
  before_action :set_bugg, only: %i[show edit update destroy]
  load_and_authorize_resource

  # GET /buggs or /buggs.json
  def index
    @pagy, @buggs = pagy(Bugg.where(qa_id: current_user.id), page: params[:page], items: 3)
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
      print '000000000000000000000000000000000000000000000000000000000000'

      print update_bugg_params[:status]
      print 'update_bugg_params[:solver_id]'
      print update_bugg_params

      if current_user.user_type == 1 && update_bugg_params[:status] == '2'
        print '1111111111111111111111111111111111111111111111111111111111111111111111111111'
        if @bugg.update(update_bugg_params)
          format.html { redirect_to bugg_url(@bugg), notice: "Bugg was successfully updated." }
          format.json { render :show, status: :ok, location: @bugg }
        end

      elsif @bugg.update(bugg_params)
        format.html { redirect_to bugg_url(@bugg), notice: "Bugg was successfully updated." }
        format.json { render :show, status: :ok, location: @bugg }

        if current_user.user_type == 1
          print "tesssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssst  "

          print params.require(:bugg).permit(:status)[:status] == '2'
          print params.require(:bugg).permit(:status)[:status].class
          if params.require(:bugg).permit(:status)[:status] == '2'

            print "tesssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssst"
            # current_user.solved_buggs << @bugg
            # @bugg.update_attribute(:solver_id, current_user.id)
            # print(bugs)

          end
        end

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

  def update_bugg_params
    params.require(:bugg).permit(:title, :description, :bugg_type, :deadline, :status, :screenshot, :project_id, :solver_id)
  end
end
