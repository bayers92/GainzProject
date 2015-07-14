class Lift < ActiveRecord::Base
  belongs_to :part
  has_many :scores, dependent: :destroy

  scope :by_style, -> style { where(:style => style) }
end
