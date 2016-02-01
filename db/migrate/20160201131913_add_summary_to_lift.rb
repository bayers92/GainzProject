class AddSummaryToLift < ActiveRecord::Migration
  def change
    add_column :lifts, :summary, :text
  end
end
