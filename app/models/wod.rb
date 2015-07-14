class Wod < ActiveRecord::Base
  belongs_to :part
  has_many :scores, dependent: :destroy
end
