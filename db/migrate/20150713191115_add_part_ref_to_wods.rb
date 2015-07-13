class AddPartRefToWods < ActiveRecord::Migration
  def change
    add_reference :wods, :part, index: true, foreign_key: true
  end
end
