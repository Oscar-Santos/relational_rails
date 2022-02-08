class Band < ApplicationRecord
  has_many :musicians
  validates_presence_of :name

  def self.sort
    # order("updated_at desc").pluck(:name)
    order("updated_at desc")
  end

  # def self.sort_members(band)
  #   band.musicians.order(:name)
  # end
  def sort_members
    self.musicians.order(:name)
  end

end
