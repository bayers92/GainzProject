class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.references :workout, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
