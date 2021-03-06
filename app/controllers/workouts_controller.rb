class WorkoutsController < ApplicationController
  before_action :authenticate_admin!, only: [:edit, :update, :destroy, :create]
  before_action :set_workout, only: [:show, :edit, :update, :destroy, :leaderboard]
  # load_and_authorize_resource


  def leaderboard 
  end

  def future
    @workouts = Workout.where('workout_date > ?', Time.now)
  end

  # GET /workouts
  # GET /workouts.json
  def index
    if params[:category]
      # @workouts = Workout.where('workout_date > ?', Time.now).('workout_date ASC')

      @workouts = Workout.where('workout_date > ?', Time.now).order('workout_date ASC')
      redirect_to :controller => 'workouts', :action => 'future' 
    elsif [params[:week]]
      wk = [params[:week]]
      @wk = wk[0].to_i
      d = Date.today.at_beginning_of_week
      offset = 7*(@wk)
      @start_time = d - offset.days
      @end_time = 7.day.since(@start_time)
      @workouts = Workout.where('workout_date >= ? and workout_date < ?', @start_time, @end_time).order('workout_date ASC')
    else
      # @workouts = Workout.where('workout_date <= ?', Time.now).order('workout_date DESC')
      start_time = Date.today.at_beginning_of_week
      end_time = 7.day.since(start_time)
      @workouts = Workout.where('workout_date >= ? and workout_date < ?', @start_time, @end_time).order('workout_date ASC')
    end
  end

  # GET /workouts/1
  # GET /workouts/1.json
  def show
  end

  # GET /workouts/new
  def new
    @workout = Workout.new
  end

  # GET /workouts/1/edit
  def edit
  end

  # POST /workouts
  # POST /workouts.json
  def create
    @workout = current_admin.workouts.create(workout_params)

    respond_to do |format|
      if @workout.save
        format.html { redirect_to @workout, notice: 'Workout was successfully created.' }
        format.json { render :show, status: :created, location: @workout }
      else
        format.html { render :new }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /workouts/1
  # PATCH/PUT /workouts/1.json
  def update
    respond_to do |format|
      if @workout.update(workout_params)
        format.html { redirect_to @workout, notice: 'Workout was successfully updated.' }
        format.json { render :show, status: :ok, location: @workout }
      else
        format.html { render :edit }
        format.json { render json: @workout.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workouts/1
  # DELETE /workouts/1.json
  def destroy
    @workout.destroy
    respond_to do |format|
      format.html { redirect_to workouts_url, notice: 'Workout was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workout
      @workout = Workout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def workout_params
      params.require(:workout).permit(:title, :admin_id, :workout_date)
    end
end
