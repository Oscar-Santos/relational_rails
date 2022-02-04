class Band < ApplicationRecord
  has_many :musicians
  validates_presence_of :name
end
