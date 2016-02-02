class LiftsController < ApplicationController
  before_action :set_lift, only: [:show, :edit, :update, :destroy]

  has_scope :by_style

  # GET /lifts
  # GET /lifts.json
  def index
    @lifts = apply_scopes(Lift).all.order('created_at DESC')
    @lift = Lift.new
    @score = @lift.scores.build
  end

  # GET /lifts/1
  # GET /lifts/1.json
  def show
  end

  # GET /lifts/new
  def new
    @lift = Lift.new
  end

  # GET /lifts/1/edit
  def edit
  end

  # POST /lifts
  # POST /lifts.json
  def create
    @lift = Lift.new(lift_params)
    if @part != nil
      @part = Part.find(@lift.part_id)
    end
    if @workout != nil
      @workout = Workout.find(@part.workout_id)
    end
    @lift.style = @lift.category.style
    @lift.save

    respond_to do |format|
      if @lift.save
        if @workout != nil
          format.html { redirect_to @workout, notice: 'Lift was successfully created.' }
        else
          format.html { redirect_to :back, notice: 'Lift was successfully created.' }
        end
        format.json { render :show, status: :created, location: @lift }
      else
        format.html { render :new }
        format.json { render json: @lift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lifts/1
  # PATCH/PUT /lifts/1.json
  def update
    @part = Part.find(@lift.part_id)
    @workout = Workout.find(@part.workout_id)

    respond_to do |format|
      if @lift.update(lift_params)
          @lift.style = @lift.category.style
        @lift.save
        format.html { redirect_to @workout, notice: 'Lift was successfully updated.' }
        format.json { render :show, status: :ok, location: @lift }
      else
        format.html { render :edit }
        format.json { render json: @lift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lifts/1
  # DELETE /lifts/1.json
  def destroy
        @part = Part.find(@lift.part_id)
    @workout = Workout.find(@part.workout_id)
    @lift.destroy
    respond_to do |format|
      format.html { redirect_to @workout, notice: 'Lift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lift
      @lift = Lift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lift_params
      params.require(:lift).permit(:style, :description, :rep_count, :part_id, :category_id, :timing, :max, :summary, :lift_date, :scores_attributes => [:result, :user_id])
    end
end
