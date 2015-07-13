class AddTypeToPart < ActiveRecord::Migration
  def change
    add_column :parts, :type, :integer
  end
end
