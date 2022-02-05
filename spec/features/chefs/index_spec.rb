require 'rails_helper'

# User Story 1, Parent Index (x2)
#
# For each Chef table
# As a visitor
# When I visit '/chefs'
# Then I see the name of each chef record in the system

RSpec.describe 'chef index' do
  it ' displays name of chef' do
    chef_1 = Chef.create!(name: 'Jose Beltran', age: 45, is_male: true, years_employed: 8)
    chef_2 = Chef.create!(name: 'Gaston Acurio', age: 39, is_male: true, years_employed: 11)
    chef_3 = Chef.create!(name: 'Lena Rojas', age: 29, is_male: false, years_employed: 8)

    visit "/chefs/"
    
    expect(page).to have_content(chef_1.name)
    expect(page).to have_content(chef_2.name)
    expect(page).to have_content(chef_3.name)
  end
end
