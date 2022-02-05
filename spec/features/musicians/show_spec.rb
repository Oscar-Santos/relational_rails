
require 'rails_helper'

RSpec.describe 'Musician show action' do
  before :each do
    @acdc = Band.create!(name:'AC/DC', founded:1973, genre:'hard rock', currently_active:false)

    @angus = @acdc.musicians.create!(name:'Angus Young', instrument:'lead guitar', founding_member:true, born:1955)
    sleep 2
    @brian = @acdc.musicians.create!(name:'Brian Johnson', instrument:'lead vocals', founding_member:false, born:1947)
  end

  it 'User Story 4, Child Show displays all Musician information' do
    visit "/musicians/#{@angus.id}"
    # save_and_open_page

    expect(page).to have_content(@angus.id)
    expect(page).to_not have_content(@brian.id)
    expect(page).to have_content(@angus.instrument)
    expect(page).to_not have_content(@brian.instrument)
    expect(page).to have_content(@angus.founding_member)
    expect(page).to_not have_content(@brian.founding_member)
    expect(page).to have_content(@angus.born)
    expect(page).to_not have_content(@brian.born)
    expect(page).to have_content(@angus.created_at)
    expect(page).to_not have_content(@brian.created_at)
    expect(page).to have_content(@angus.updated_at)
    expect(page).to_not have_content(@brian.updated_at)

    expect(page).to have_content(@angus.band.name)
  end

  it 'User Story 8, Child Index Link' do
    visit "/musicians/#{@angus.id}"

    expect(page).to have_link("Musicians Index")
    click_link "Musicians Index"
    # save_and_open_page

    expect(page).to have_content(@angus.name)
    expect(page).to have_content(@brian.name)
  end

  it 'User Story 9, Parent Index Link' do
    devo = Band.create!(name:'DEVO', founded:1973, genre:'new wave', currently_active:true)
    visit "/musicians/#{@angus.id}"

    expect(page).to have_link("Bands Index")
    click_link "Bands Index"
    # save_and_open_page

    expect(page).to have_content(@acdc.name)
    expect(page).to have_content(devo.name)
  end

end
