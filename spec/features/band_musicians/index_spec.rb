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


  it 'User Story 5, Parent Children Index' do

    visit "/bands/#{@metallica.id}/musicians"
    #save_and_open_page

    expect(page).to have_content(@metallica.name)

    expect(page).to have_content(@cliff.name)
    expect(page).to have_content(@cliff.instrument)
    expect(page).to have_content(@kirk.name)
    expect(page).to have_content(@kirk.instrument)
    expect(page).to have_content(@james.name)
    expect(page).to have_content(@james.instrument)
    expect(page).to have_content(@lars.name)
    expect(page).to have_content(@lars.instrument)

    expect(page).to_not have_content(@john.name)
    expect(page).to_not have_content(@john.instrument)
  end

  it 'User Story 8, Child Index Link' do
    visit "/bands/#{@metallica.id}/musicians"

    expect(page).to have_link("Musicians Index")
    click_link "Musicians Index"

    expect(page).to have_content(@john.name)
    expect(page).to have_content(@lars.name)
    save_and_open_page

  end
end
