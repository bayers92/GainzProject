class AddTimestampsToWorkout < ActiveRecord::Migration
  def change
      add_column(:workouts, :workout_date, :datetime)
  end
end
