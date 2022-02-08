class Musician < ApplicationRecord
  belongs_to :band
  validates_presence_of :name

  def self.bandmate_count(band_key)
    Musician.where(band_id: band_key).count
  end
end
