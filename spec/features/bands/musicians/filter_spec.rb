require 'rails_helper'

RSpec.describe 'User Story 21, birth year filter' do
  before :each do
    @beatles = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)

    @john = @beatles.musicians.create!(name:'John Lennon', instrument:'guitar, vocals', founding_member:true, born:1940)
    @george = @beatles.musicians.create!(name:'George Harrison', instrument:'lead guitar, vocals', founding_member:true, born:1943)
    @paul = @beatles.musicians.create!(name:'Paul McCartney', instrument:'bass, vocals', founding_member:true, born:1942)
    @ringo = @beatles.musicians.create!(name:'Ringo Starr', instrument:'drums, vocals', founding_member:false, born:1940)
  end

  it 'US21: picks a year between members birthdates' do
    visit "/bands/#{@beatles.id}/musicians"

    expect(page).to have_content(@john.name)
    expect(page).to have_content(@george.name)
    expect(page).to have_content(@paul.name)
    expect(page).to have_content(@ringo.name)

    fill_in('Year', with: '1941')
    click_button('Only show members born before this year')

    expect(current_path).to eq("/bands/#{@beatles.id}/musicians")

    expect(page).to have_content(@john.name)
    expect(page).to_not have_content(@george.name)
    expect(page).to_not have_content(@paul.name)
    expect(page).to have_content(@ringo.name)
  end

it 'US21: picks a year after all members birthdates' do
    visit "/bands/#{@beatles.id}/musicians"

    expect(page).to have_content(@john.name)
    expect(page).to have_content(@george.name)
    expect(page).to have_content(@paul.name)
    expect(page).to have_content(@ringo.name)

    fill_in('Year', with: '1990')
    click_button('Only show members born before this year')

    expect(current_path).to eq("/bands/#{@beatles.id}/musicians")

    expect(page).to have_content(@john.name)
    expect(page).to have_content(@george.name)
    expect(page).to have_content(@paul.name)
    expect(page).to have_content(@ringo.name)
  end

  it 'US21: picks a year before all members birthdates' do
    visit "/bands/#{@beatles.id}/musicians"

    expect(page).to have_content(@john.name)
    expect(page).to have_content(@george.name)
    expect(page).to have_content(@paul.name)
    expect(page).to have_content(@ringo.name)

    fill_in('Year', with: '1930')
    click_button('Only show members born before this year')

    expect(current_path).to eq("/bands/#{@beatles.id}/musicians")

    expect(page).to_not have_content(@john.name)
    expect(page).to_not have_content(@george.name)
    expect(page).to_not have_content(@paul.name)
    expect(page).to_not have_content(@ringo.name)
  end

  it 'US21: does nothing if button is clicked without filling in the form' do
    visit "/bands/#{@beatles.id}/musicians"

    expect(page).to have_content(@john.name)
    expect(page).to have_content(@george.name)
    expect(page).to have_content(@paul.name)
    expect(page).to have_content(@ringo.name)

    click_button('Only show members born before this year')

    expect(current_path).to eq("/bands/#{@beatles.id}/musicians")

    expect(page).to have_content(@john.name)
    expect(page).to have_content(@george.name)
    expect(page).to have_content(@paul.name)
    expect(page).to have_content(@ringo.name)
  end

  it 'US21: handles back-to-back requests' do
    visit "/bands/#{@beatles.id}/musicians"

    fill_in('Year', with: '1930')
    click_button('Only show members born before this year')

    expect(page).to_not have_content(@john.name)
    expect(page).to_not have_content(@george.name)
    expect(page).to_not have_content(@paul.name)
    expect(page).to_not have_content(@ringo.name)

    fill_in('Year', with: '1990')
    click_button('Only show members born before this year')

    expect(page).to have_content(@john.name)
    expect(page).to have_content(@george.name)
    expect(page).to have_content(@paul.name)
    expect(page).to have_content(@ringo.name)

    fill_in('Year', with: '1941')
    click_button('Only show members born before this year')

    expect(page).to have_content(@john.name)
    expect(page).to_not have_content(@george.name)
    expect(page).to_not have_content(@paul.name)
    expect(page).to have_content(@ringo.name)

    click_button('Only show members born before this year')

    expect(current_path).to eq("/bands/#{@beatles.id}/musicians")

    expect(page).to have_content(@john.name)
    expect(page).to have_content(@george.name)
    expect(page).to have_content(@paul.name)
    expect(page).to have_content(@ringo.name)
  end

end
