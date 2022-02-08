class Band < ApplicationRecord
  has_many :musicians
  validates_presence_of :name

  def self.sort
    order("updated_at desc").pluck(:name)
  end

end
 
