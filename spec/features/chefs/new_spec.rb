require 'rails_helper'

# User Story 11, Chef Creation (x2)

# As a visitor
# When I visit the Chef Index page
# Then I see a link to create a new Chef record, "New Chef"
# When I click this link
# Then I am taken to '/chefs/new' where I  see a form for a new chef record
  # When I fill out the form with a new parent's attributes:

# And I click the button "Create Chef" to submit the form
# Then a `POST` request is sent to the '/chefs' route,
# a new chef record is created,
# and I am redirected to the Chef Index page where I see the new Chef displayed.

RSpec.describe 'wip' do

  it 'it allows to create a new chef' do


    visit "/chefs"
# Then I am taken to '/chefs/new' where I  see a form for a new chef record
    expect(page).to have_link('create chef')
    click_on('create chef')

    expect(current_path).to eq('/chefs/new')
    # When I fill out the form with a new parent's attributes:
    
    fill_in(:name, with: "Jose")

    fill_in(:age, with: "32")

    fill_in(:is_male, with: "Male")

    fill_in(:years_employed, with: "9")
    # And I click the button "Create Chef" to submit the form
    click_on('create chef')

    # and I am redirected to the Chef Index page where I see the new Chef displayed.
    expect(current_path).to eq('/chefs')

    # and I am redirected to the Chef Index page where I see the new Chef displayed.
    expect(page).to have_content('Jose')
  end
end
