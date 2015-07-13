class Part < ActiveRecord::Base
  belongs_to :workout
  has_many :lifts, dependent: :destroy
  has_many :wods, dependent: :destroy
end
