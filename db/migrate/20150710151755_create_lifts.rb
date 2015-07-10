class CreateLifts < ActiveRecord::Migration
  def change
    create_table :lifts do |t|
      t.integer :type
      t.string :description
      t.integer :rep_count
      t.references :workout, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
