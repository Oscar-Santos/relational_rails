require 'rails_helper'

RSpec.describe 'the delete musician feature' do
  before :each do
    @acdc = Band.create!(name:'AC/DC', founded:1973, genre:'hard rock', currently_active:false)
    @metallica = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)

    @angus = @acdc.musicians.create!(name:'Angus Young', instrument:'lead guitar', founding_member:true, born:1955)
    @bon = @acdc.musicians.create!(name:'Bon Scott', instrument:'lead vocals', founding_member:true, born:1946)
    @james = @metallica.musicians.create!(name:'James Hetfield', instrument:'rhythm guitar, lead vocals', founding_member:true, born:1963)
  end

  it 'User Story 19, Parent Delete' do
    visit "/musicians/#{@angus.id}"

    click_link "Delete Musician"

    expect(current_path).to eq("/musicians")

    expect(page).to_not have_content(@angus.name)
    expect(page).to have_content(@bon.name)
    expect(page).to have_content(@james.name)
  end
end
