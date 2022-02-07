require 'rails_helper'

RSpec.describe Band, type: :model do
  it { should validate_presence_of :name }
  it { should have_many :musicians }

  it 'User Story 6, Parent Index sorted by Most Recently Created' do
    @band_1 = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)
    @band_2 = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)
    @band_3 = Band.create!(name:'AC/DC', founded:1973, genre:'hard rock', currently_active:false)

    expect(Band.sort).to eq(['AC/DC', 'The Beatles', 'Metallica'])
  end
end
