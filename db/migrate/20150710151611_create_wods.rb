class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
      t.text :description
      t.string :result_label
      t.references :workout, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
