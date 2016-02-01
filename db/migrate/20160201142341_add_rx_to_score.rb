class AddRxToScore < ActiveRecord::Migration
  def change
    add_column :scores, :rx, :boolean
  end
end
