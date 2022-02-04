require 'rails_helper'

# User Story 1, Parent Index (x2)
#
# For each Chef table
# As a visitor
# When I visit '/chefs'
# Then I see the name of each chef record in the system

RSpec.describe 'chef index' do
  it ' displays name of chef' do
    chef = Chef.create!(name: 'Jose Beltran', age: 45, is_male: true, years_employed: 8)

    visit "/chefs/"

    expect(page).to have_content(chef.name)
  end
end
