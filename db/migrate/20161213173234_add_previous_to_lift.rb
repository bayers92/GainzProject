class AddPreviousToLift < ActiveRecord::Migration
  def change
    add_column :lifts, :previous_lift, :integer, default: nil
  end
end
