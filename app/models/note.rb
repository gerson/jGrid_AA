class Note < ActiveRecord::Base
  belongs_to :product

  validates_presence_of :description
end
