class AddTimestampsToLift < ActiveRecord::Migration
  def change
    add_column :lifts, :lift_date, :datetime
  end
end
