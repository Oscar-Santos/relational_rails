class Chef < ApplicationRecord
  has_many :entrees
  validates :name, presence: true
end
