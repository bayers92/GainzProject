class RemoveWorkoutReferencesFromWoDandLift < ActiveRecord::Migration
  def change
  	remove_reference(:wods, :workout, index: true)
  	remove_reference(:lifts, :workout, index: true)
  end
end
