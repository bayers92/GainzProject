class AddPreviousToWod < ActiveRecord::Migration
  def change
    add_column :wods, :previous_wod, :integer, default: nil
  end
end
