require 'rails_helper'

RSpec.describe 'the musicians index page' do

  before :each do
    @metallica = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)
    @beatles = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)

    @cliff = @metallica.musicians.create!(name:'Cliff Burton', instrument:'bass', founding_member:false, born:1962)
    @kirk = @metallica.musicians.create!(name:'Kirk Hammett', instrument:'lead guitar', founding_member:false, born:1962)
    @james = @metallica.musicians.create!(name:'James Hetfield', instrument:'rhythm guitar, lead vocals', founding_member:true, born:1963)
    @lars = @metallica.musicians.create!(name:'Lars Ulrich', instrument:'drums', founding_member:true, born:1963)

    @john = @beatles.musicians.create!(name:'John Lennon', instrument:'guitar, vocals', founding_member:true, born:1940)

  end

  it 'User Story 13, Parent child Creation' do
    visit "/bands/#{@metallica.id}/musicians"

    expect(page).to have_content(@cliff.name)

    click_link "Create Musician"

    expect(current_path).to eq("/bands/#{@metallica.id}/musicians/new")

    fill_in('Name', with: 'Dave Mustaine')
    fill_in('Instrument', with: 'lead guitar')
    fill_in('Founding Member', with: 'false')
    fill_in('Year Born', with: '1961')

    click_button('Create Musician')

    expect(current_path).to eq("/bands/#{@metallica.id}/musicians")

    expect(page).to have_content('Dave Mustaine')
    expect(page).to have_content(@cliff.name)
  end
end
