class AddPartRefToLifts < ActiveRecord::Migration
  def change
    add_reference :lifts, :part, index: true, foreign_key: true
  end
end
