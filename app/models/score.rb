class Score < ActiveRecord::Base
  belongs_to :user
  belongs_to :lift
  belongs_to :wod
end
