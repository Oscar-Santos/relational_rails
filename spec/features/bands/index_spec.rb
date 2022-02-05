require 'rails_helper'

RSpec.describe 'the bands index page' do

  before :each do
    @band_1 = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)
    @band_2 = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)
    @band_3 = Band.create!(name:'AC/DC', founded:1973, genre:'hard rock', currently_active:false)

    @cliff = @band_1.musicians.create!(name:'Cliff Burton', instrument:'bass', founding_member:false, born:1962)
    @john = @band_2.musicians.create!(name:'John Lennon', instrument:'guitar, vocals', founding_member:true, born:1940)
    @angus = @band_3.musicians.create!(name:'Angus Young', instrument:'lead guitar', founding_member:true, born:1955)
  end

  it 'User Story 1, Parent Index' do
    visit '/bands'
    # save_and_open_page

    expect(page).to have_content(@band_1.name)
    expect(page).to have_content(@band_2.name)
    expect(page).to have_content(@band_3.name)
  end

  it 'User Story 6, Parent Index sorted by Most Recently Created' do
    visit '/bands'
    # save_and_open_page

    within("#band-0") do
      expect(page).to have_content(@band_3.name)
    end
    within("#band-1") do
      expect(page).to have_content(@band_2.name)
    end
    within("#band-2") do
      expect(page).to have_content(@band_1.name)
    end
  end

  it 'User Story 8, Child Index Link' do
    visit "/bands"

    expect(page).to have_link("Musicians Index")
    click_link "Musicians Index"
    # save_and_open_page

    expect(page).to have_content(@angus.name)
    expect(page).to have_content(@john.name)
    expect(page).to have_content(@cliff.name)
  end

  it 'User Story 9, Parent Index Link' do
    visit "/bands"

    expect(page).to have_link("Bands Index")
    click_link "Bands Index"
    # save_and_open_page

    expect(page).to have_content(@band_1.name)
    expect(page).to have_content(@band_2.name)
    expect(page).to have_content(@band_3.name)
  end

end
