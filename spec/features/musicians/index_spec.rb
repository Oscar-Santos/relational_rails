require 'rails_helper'

RSpec.describe 'the musicians index page' do
  before :each do
    @acdc = Band.create!(name:'AC/DC', founded:1973, genre:'hard rock', currently_active:false)
    @metallica = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)

    @angus = @acdc.musicians.create!(name:'Angus Young', instrument:'lead guitar', founding_member:true, born:1955)
    @bon = @acdc.musicians.create!(name:'Bon Scott', instrument:'lead vocals', founding_member:true, born:1946)
    @cliff = @metallica.musicians.create!(name:'Cliff Burton', instrument:'bass', founding_member:false, born:1962)
    @kirk = @metallica.musicians.create!(name:'Kirk Hammett', instrument:'lead guitar', founding_member:false, born:1962)
  end

  it 'User Story 3, Child Index' do
    visit '/musicians'
    # save_and_open_page

    expect(page).to have_content(@angus.name)
    expect(page).to have_content(@angus.instrument)
    expect(page).to have_content(@angus.band.name)
    expect(page).to have_content(@bon.name)
    expect(page).to have_content(@bon.instrument)
    expect(page).to have_content(@bon.band.name)
    # expect(page).to have_content(@cliff.name)
    # expect(page).to have_content(@cliff.instrument)
    # expect(page).to have_content(@cliff.band.name)
    # expect(page).to have_content(@kirk.name)
    # expect(page).to have_content(@kirk.instrument)
    # expect(page).to have_content(@kirk.band.name)
  end

  it 'User Story 8, Child Index Link' do
    visit "/musicians"

    expect(page).to have_link("Musicians Index")
    click_link "Musicians Index"
    # save_and_open_page
  end

  it 'User Story 9, Parent Index Link' do
    visit "/musicians"

    expect(page).to have_link("Bands Index")
    click_link "Bands Index"
    # save_and_open_page

    expect(page).to have_content(@acdc.name)
    expect(page).to have_content(@metallica.name)
  end

  it 'User Story 15, Child Index only shows `true` Records' do
    visit "/musicians"

    expect(page).to_not have_content('false')

    expect(page).to have_content(@angus.name)
    expect(page).to have_content(@bon.name)
    expect(page).to_not have_content(@cliff.name)
    expect(page).to_not have_content(@kirk.name)
  end

  it 'User Story 18, Child Update from Childs Index Page' do
    visit "/musicians"

    within("#musician-#{@angus.id}") do
      click_link "edit musician"

      expect(current_path).to eq("/musicians/#{@angus.id}/edit")
    end

    visit "/musicians"

    within("#musician-#{@bon.id}") do
      click_link "edit musician"
      expect(current_path).to eq("/musicians/#{@bon.id}/edit")
    end
  end
end
