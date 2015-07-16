class Picture < ActiveRecord::Base
  belongs_to :picable , polymorphic: true
end
