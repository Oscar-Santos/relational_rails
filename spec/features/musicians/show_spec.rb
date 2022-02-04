
require 'rails_helper'

RSpec.describe 'Musician show action' do

  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes:

  it 'User Story 4, Child Show displays all Musician information' do
    acdc = Band.create!(name:'AC/DC', founded:1973, genre:'hard rock', currently_active:false)
    angus = acdc.musicians.create!(name:'Angus Young', instrument:'lead guitar', founding_member:true, born:1955)
    sleep 2
    brian = acdc.musicians.create!(name:'Brian Johnson', instrument:'lead vocals', founding_member:false, born:1947)

    visit "/musicians/#{angus.id}"
    save_and_open_page

    expect(page).to have_content(angus.id)
    expect(page).to_not have_content(brian.id)
    expect(page).to have_content(angus.instrument)
    expect(page).to_not have_content(brian.instrument)
    expect(page).to have_content(angus.founding_member)
    expect(page).to_not have_content(brian.founding_member)
    expect(page).to have_content(angus.born)
    expect(page).to_not have_content(brian.born)
    expect(page).to have_content(angus.created_at)
    expect(page).to_not have_content(brian.created_at)
    expect(page).to have_content(angus.updated_at)
    expect(page).to_not have_content(brian.updated_at)

    expect(page).to have_content(angus.band.name)
  end
end
