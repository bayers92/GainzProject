class AddCategoryRefToLifts < ActiveRecord::Migration
  def change
    add_reference :lifts, :category, index: true, foreign_key: true
  end
end
