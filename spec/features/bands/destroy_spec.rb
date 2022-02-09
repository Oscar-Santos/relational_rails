require 'rails_helper'

RSpec.describe 'the delete band feature' do
  before :each do
    @acdc = Band.create!(name:'AC/DC', founded:1973, genre:'hard rock', currently_active:false)
    @metallica = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)

    @angus = @acdc.musicians.create!(name:'Angus Young', instrument:'lead guitar', founding_member:true, born:1955)
    @bon = @acdc.musicians.create!(name:'Bon Scott', instrument:'lead vocals', founding_member:true, born:1946)
    @james = @metallica.musicians.create!(name:'James Hetfield', instrument:'rhythm guitar, lead vocals', founding_member:true, born:1963)
    @lars = @metallica.musicians.create!(name:'Lars Ulrich', instrument:'drums', founding_member:true, born:1963)
  end

  it 'User Story 19, Parent Delete' do
    visit "/bands/#{@acdc.id}"

    click_link "Delete Band"

    expect(current_path).to eq("/bands")

    expect(page).to_not have_content(@acdc.name)
    expect(page).to have_content(@metallica.name)

    click_link "Musicians Index"

    expect(page).to_not have_content(@angus.name)
    expect(page).to_not have_content(@bon.name)
    expect(page).to have_content(@james.name)
    expect(page).to have_content(@lars.name)
  end
end
