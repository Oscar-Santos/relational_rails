require 'rails_helper'

RSpec.describe 'Band show action' do
  before :each do
    @beatles = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)
    @john = @beatles.musicians.create!(name:'John Lennon', instrument:'guitar, vocals', founding_member:true, born:1940)
    @george = @beatles.musicians.create!(name:'George Harrison', instrument:'lead guitar, vocals', founding_member:true, born:1943)
    @paul = @beatles.musicians.create!(name:'Paul McCartney', instrument:'bass, vocals', founding_member:true, born:1942)
    @ringo = @beatles.musicians.create!(name:'Ringo Starr', instrument:'drums, vocals', founding_member:false, born:1940)
    sleep 2
    @devo = Band.create!(name:'DEVO', founded:1973, genre:'new wave', currently_active:true)
    @mark = @devo.musicians.create!(name:'Mark Mothersbaugh', instrument:'synthesizers, vocals', founding_member: true, born: 1950)
  end

  it 'User Story 2, Parent Show displays all Band information' do
    visit "/bands/#{@beatles.id}"
    # save_and_open_page

    expect(page).to have_content(@beatles.id)
    expect(page).to_not have_content(@devo.id)
    expect(page).to have_content(@beatles.name)
    expect(page).to_not have_content(@devo.name)
    expect(page).to have_content(@beatles.founded)
    expect(page).to_not have_content(@devo.founded)
    expect(page).to have_content(@beatles.genre)
    expect(page).to_not have_content(@devo.genre)
    expect(page).to have_content(@beatles.currently_active)
    expect(page).to_not have_content(@devo.currently_active)
    expect(page).to have_content(@beatles.created_at)
    expect(page).to_not have_content(@devo.created_at)
    expect(page).to have_content(@beatles.updated_at)
    expect(page).to_not have_content(@devo.updated_at)
  end

  it 'User Story 7, Parent Child Count' do
    visit "/bands/#{@beatles.id}"
    # save_and_open_page

    member_count = Musician.where(band_id: "#{@beatles.id}").count

    expect(page).to have_content("#{member_count} musician records available.")
  end

  it 'User Story 8, Child Index Link' do
    visit "/bands/#{@beatles.id}"

    expect(page).to have_link("Musicians Index")
    click_link "Musicians Index"
    # save_and_open_page

    expect(page).to have_content(@john.name)
    expect(page).to have_content(@george.name)
    expect(page).to have_content(@paul.name)
    expect(page).to have_content(@ringo.name)
  end

  it 'User Story 9, Parent Index Link' do
    visit "/bands/#{@beatles.id}"

    expect(page).to have_link("Bands Index")
    click_link "Bands Index"
    # save_and_open_page

    expect(page).to have_content(@beatles.name)
    expect(page).to have_content(@devo.name)
  end

  it 'User Story 10, Parent Child Index Link' do
    visit "/bands/#{@beatles.id}"
    # save_and_open_page
    expect(page).to have_link("see all musicians in #{@beatles.name}")
    click_link "see all musicians in #{@beatles.name}"
    # save_and_open_page

    expect(page).to have_content(@john.name)
    expect(page).to have_content(@george.name)
    expect(page).to have_content(@paul.name)
    expect(page).to have_content(@ringo.name)

    expect(page).to_not have_content(@mark.name)
  end

end
