class Band < ApplicationRecord
  has_many :musicians
  validates_presence_of :name

  def self.sort
    order("updated_at desc")
  end

  def sort_members
    self.musicians.order(:name)
  end

  def filter(year = nil)
    if year != nil && year != ""
      self.musicians.where("born < #{year}").order(:name)
    else
      self.musicians.order(:name)
    end
  end

end
