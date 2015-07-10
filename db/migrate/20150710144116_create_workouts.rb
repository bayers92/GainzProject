class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :title
      t.references :admin, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
