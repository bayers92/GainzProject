class RemoveTypeFromParts < ActiveRecord::Migration
  def change
  	remove_column :parts, :type
  end
end
