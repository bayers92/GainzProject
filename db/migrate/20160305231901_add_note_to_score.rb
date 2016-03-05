class AddNoteToScore < ActiveRecord::Migration
  def change
    add_column :scores, :note, :text
  end
end
