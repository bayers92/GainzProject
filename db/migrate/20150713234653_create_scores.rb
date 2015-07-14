class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :result
      t.references :user, index: true, foreign_key: true
      t.references :lift, index: true, foreign_key: true
      t.references :wod, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
