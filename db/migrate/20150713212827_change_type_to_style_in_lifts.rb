class ChangeTypeToStyleInLifts < ActiveRecord::Migration
  def change
  	remove_column :lifts, :type
  	add_column :lifts, :style, :integer
  end
end
