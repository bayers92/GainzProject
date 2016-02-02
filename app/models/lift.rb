class Lift < ActiveRecord::Base
  belongs_to :part
  belongs_to :category
  has_many :scores, dependent: :destroy
  accepts_nested_attributes_for :scores

  scope :by_style, -> style { where(:style => style) }
end
