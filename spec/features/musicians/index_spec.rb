require 'rails_helper'

RSpec.describe 'the musicians index page' do

  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes:


  it 'User Story 3, Child Index' do
    acdc = Band.create!(name:'AC/DC', founded:1973, genre:'hard rock', currently_active:false)
    metallica = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)

    angus = acdc.musicians.create!(name:'Angus Young', instrument:'lead guitar', founding_member:true, born:1955)
    bon = acdc.musicians.create!(name:'Bon Scott', instrument:'lead vocals', founding_member:true, born:1946)
    cliff = metallica.musicians.create!(name:'Cliff Burton', instrument:'bass', founding_member:false, born:1962)
    kirk = metallica.musicians.create!(name:'Kirk Hammett', instrument:'lead guitar', founding_member:false, born:1962)

    visit '/musicians'
    save_and_open_page

    expect(page).to have_content(angus.name)
    expect(page).to have_content(angus.instrument)
    expect(page).to have_content(angus.band.name)
    expect(page).to have_content(bon.name)
    expect(page).to have_content(bon.instrument)
    expect(page).to have_content(bon.band.name)
    expect(page).to have_content(cliff.name)
    expect(page).to have_content(cliff.instrument)
    expect(page).to have_content(cliff.band.name)
    expect(page).to have_content(kirk.name)
    expect(page).to have_content(kirk.instrument)
    expect(page).to have_content(kirk.band.name)
  end
end
