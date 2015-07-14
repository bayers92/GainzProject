class WodsController < ApplicationController
  before_action :set_wod, only: [:show, :edit, :update, :destroy]

  # GET /wods
  # GET /wods.json
  def index
    @wods = Wod.all
  end

  # GET /wods/1
  # GET /wods/1.json
  def show
  end

  # GET /wods/new
  def new
    @wod = Wod.new
  end

  # GET /wods/1/edit
  def edit
  end

  # POST /wods
  # POST /wods.json
  def create
    @wod = Wod.new(wod_params)

    @part = Part.find(@wod.part_id)
    @workout = Workout.find(@part.workout_id)

    respond_to do |format|
      if @wod.save
        format.html { redirect_to @workout, notice: 'Wod was successfully created.' }
        format.json { render :show, status: :created, location: @wod }
      else
        format.html { render :new }
        format.json { render json: @wod.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wods/1
  # PATCH/PUT /wods/1.json
  def update
        @part = Part.find(@wod.part_id)
    @workout = Workout.find(@part.workout_id)
    respond_to do |format|
      if @wod.update(wod_params)
        format.html { redirect_to @workout, notice: 'Wod was successfully updated.' }
        format.json { render :show, status: :ok, location: @wod }
      else
        format.html { render :edit }
        format.json { render json: @wod.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wods/1
  # DELETE /wods/1.json
  def destroy
        @part = Part.find(@wod.part_id)
    @workout = Workout.find(@part.workout_id)
    @wod.destroy
    respond_to do |format|
      format.html { redirect_to @workout, notice: 'Wod was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wod
      @wod = Wod.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wod_params
      params.require(:wod).permit(:description, :result_label, :part_id, :title)
    end
end
