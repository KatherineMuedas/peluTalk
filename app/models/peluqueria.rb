class Peluqueria < ActiveRecord::Base
  has_many :pictures, as: :picable, dependent: :destroy
  accepts_nested_attributes_for :pictures
end
