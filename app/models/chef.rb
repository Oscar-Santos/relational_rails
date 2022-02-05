class Chef < ApplicationRecord
  has_many :entrees
  validates_presence_of :name

  def self.order_by_creation
    Chef.order(created_at: :desc)
  end
end
