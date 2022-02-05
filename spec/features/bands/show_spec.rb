require 'rails_helper'

RSpec.describe 'Band show action' do

  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table

  it 'User Story 2, Parent Show displays all Band information' do
    beatles = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)
    sleep 2
    devo = Band.create!(name:'DEVO', founded:1973, genre:'new wave', currently_active:true)


    visit "/bands/#{beatles.id}"
    # save_and_open_page

    expect(page).to have_content(beatles.id)
    expect(page).to_not have_content(devo.id)
    expect(page).to have_content(beatles.name)
    expect(page).to_not have_content(devo.name)
    expect(page).to have_content(beatles.founded)
    expect(page).to_not have_content(devo.founded)
    expect(page).to have_content(beatles.genre)
    expect(page).to_not have_content(devo.genre)
    expect(page).to have_content(beatles.currently_active)
    expect(page).to_not have_content(devo.currently_active)
    expect(page).to have_content(beatles.created_at)
    expect(page).to_not have_content(devo.created_at)
    expect(page).to have_content(beatles.updated_at)
    expect(page).to_not have_content(devo.updated_at)
  end

  it 'User Story 7, Parent Child Count' do
    beatles = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)
    beatles.musicians.create!(name:'John Lennon', instrument:'guitar, vocals', founding_member:true, born:1940)
    beatles.musicians.create!(name:'George Harrison', instrument:'lead guitar, vocals', founding_member:true, born:1943)
    beatles.musicians.create!(name:'Paul McCartney', instrument:'bass, vocals', founding_member:true, born:1942)
    beatles.musicians.create!(name:'Ringo Starr', instrument:'drums, vocals', founding_member:false, born:1940)

    visit "/bands/#{beatles.id}"
    #save_and_open_page

    member_count = Musician.where(band_id: "#{beatles.id}").count

    expect(page).to have_content("#{member_count} musician records available.")
  end

end
