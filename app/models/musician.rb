class Musician < ApplicationRecord
  belongs_to :band
  validates_presence_of :name

  def self.bandmate_count(band_key)
    where(band_id: band_key).count
  end

  def self.founders_only
    where(founding_member: true)
  end
end
