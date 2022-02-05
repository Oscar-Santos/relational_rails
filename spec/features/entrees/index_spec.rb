require 'rails_helper'

# User Story 3, Child Index (x2)
#
# As a visitor
# When I visit '/entrees_name'
# Then I see each entree in the system including the Entree's attributes:

RSpec.describe 'entree index' do
  it 'displays each entree and its attributes' do
    gaston = Chef.create!(name: 'Gaston Acurio', age: 40, is_male: true, years_employed: 11)
    virgilio = Chef.create!(name: 'Virgilio Morales', age: 33, is_male: true, years_employed: 9)

    entree_1 = gaston.entrees.create!(name: 'Papa rellena', hot_dish: true, calories: 367)
    entree_2 = virgilio.entrees.create!(name: 'Ocopa', hot_dish: false, calories: 199)

    visit '/entrees'

    expect(page).to have_content(entree_1.name)
    expect(page).to have_content(entree_2.name)
  end
end
