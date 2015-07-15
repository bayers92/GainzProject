class AddTimingAndMaxToLift < ActiveRecord::Migration
  def change
  	add_column :lifts, :timing, :string
  	add_column :lifts, :max, :boolean
  end
end
