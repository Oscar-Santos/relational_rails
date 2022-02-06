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
    save_and_open_page
    expect(page).to have_link('create chef')
    click_on ('create chef')
    expect(current_path).to be('/chefs/new')
    expect(page).to have_content('Name')
    fill_in( 'Name', with: "Jose")
    expect(page).to have_content('Age')
    fill_in( 'Age', with: "32")
    expect(page).to have_content('Gender')
    fill_in( 'Gender', with: "Male")
    expect(page).to have_content('Years Employed')
    fill_in( 'Years Employed', with: "9")
    click_on ('create chef')
    expect(current_path).to be('/chefs')
    expect(page).to have_content('Jose')
  end
end
