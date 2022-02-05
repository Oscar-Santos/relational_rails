require 'rails_helper'

# User Story 2, Parent Show (x2)
#
# As a visitor
# When I visit '/chef/:id'
# Then I see the chef with that id including the chef's attributes:
# - data from each column that is on the chef table
RSpec.describe 'chef show page' do
  it 'it has attributes' do
    chef = Chef.create!(name: 'Jose Beltran', age: 45, is_male: true, years_employed: 8)

    visit "/chefs/#{chef.id}"

    expect(page).to have_content(chef.name)
    expect(page).to have_content(chef.age)
    expect(page).to have_content(chef.is_male)
    expect(page).to have_content(chef.years_employed)
  end
end
