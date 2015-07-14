class ScoresController < ApplicationController
  before_action :set_score, only: [:show, :edit, :update, :destroy]

  # GET /scores
  # GET /scores.json
  def index
    @scores = Score.all
  end

  # GET /scores/1
  # GET /scores/1.json
  def show
  end

  # GET /scores/new
  def new
    @score = Score.new
  end

  # GET /scores/1/edit
  def edit
  end

  # POST /scores
  # POST /scores.json
  def create
    @score = Score.new(score_params)

    if @score.wod_id 
      @x = Wod.find(@score.wod_id)
    else
      @x = Lift.find(@score.lift_id)
    end
    @part = Part.find(@x.part_id)
    @workout = Workout.find(@part.workout_id)

    respond_to do |format|
      if @score.save
        format.html { redirect_to @workout, notice: 'Score was successfully created.' }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { render :new }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1
  # PATCH/PUT /scores/1.json
  def update

    if @score.wod_id 
      @x = Wod.find(@score.wod_id)
    else
      @x = Lift.find(@score.lift_id)
    end
    @part = Part.find(@x.part_id)
    @workout = Workout.find(@part.workout_id)

    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to @workout, notice: 'Score was successfully updated.' }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1
  # DELETE /scores/1.json
  def destroy

    if @score.wod_id 
      @x = Wod.find(@score.wod_id)
    else
      @x = Lift.find(@score.lift_id)
    end
    @part = Part.find(@x.part_id)
    @workout = Workout.find(@part.workout_id)

    @score.destroy
    respond_to do |format|
      format.html { redirect_to @workout, notice: 'Score was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def score_params
      params.require(:score).permit(:result, :user_id, :lift_id, :wod_id)
    end
end
