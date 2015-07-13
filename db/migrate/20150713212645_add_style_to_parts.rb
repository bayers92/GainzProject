class AddStyleToParts < ActiveRecord::Migration
  def change
    add_column :parts, :style, :integer
  end
end
