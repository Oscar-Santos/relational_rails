class Chef < ApplicationRecord
  has_many :entrees
  validates_presence_of :name
end
