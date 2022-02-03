require 'rails_helper'

RSpec.describe 'the bands index page' do
  it 'displays a list of all band names' do
    band_1 = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)
    band_2 = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)
    band_3 = Band.create!(name:'AC/DC', founded:1973, genre:'hard rock', currently_active:false)
    visit '/bands'
    save_and_open_page
    expect(page).to have_content(band_1.name)
    expect(page).to have_content(band_2.name)
    expect(page).to have_content(band_3.name)
  end
end
