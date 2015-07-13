class Workout < ActiveRecord::Base
  belongs_to :admin
  has_many :parts, dependent: :destroy

end
