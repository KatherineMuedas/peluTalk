class Review < ActiveRecord::Base
  belongs_to :peluqueria
  belongs_to :user
  has_one :picture, as: :picable, dependent: :destroy
  # accepts_nested_attributes_for :picture, reject_if: proc { |attributes| attributes['photo'].blank? }, allow_destroy: true

  validates :pelu_rating, presence: true
end
