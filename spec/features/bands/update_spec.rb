require 'rails_helper'

RSpec.describe 'the bands#update feature' do

  it 'User Story 12, Parent Update: Replace all values' do
    acdc = Band.create!(name:'AB/CD', founded:1873, genre:'shoegaze', currently_active:true)

    visit "/bands/#{acdc.id}"

    click_link "Edit Band"

    expect(current_path).to eq("/bands/#{acdc.id}/edit")

    fill_in('Name', with: 'AC/DC')
    fill_in('Year Founded', with: '1973')
    fill_in('Genre', with: 'hard rock')
    fill_in('Currently Active', with: 'false')

    click_button('Update Band')

    expect(current_path).to eq("/bands/#{acdc.id}")

    expect(page).to have_content('AC/DC')
    expect(page).to have_content('1973')
    expect(page).to have_content('hard rock')
    expect(page).to have_content('false')

    expect(page).to_not have_content('AB/CD')
    expect(page).to_not have_content('1873')
    expect(page).to_not have_content('shoegaze')
    expect(page).to_not have_content('true')
  end

  it 'User Story 12, Parent Update: Replace no values' do
    acdc = Band.create!(name:'AB/CD', founded:1873, genre:'shoegaze', currently_active:true)

    visit "/bands/#{acdc.id}"

    click_link "Edit Band"

    expect(current_path).to eq("/bands/#{acdc.id}/edit")

    click_button('Update Band')

    expect(current_path).to eq("/bands/#{acdc.id}")

    expect(page).to have_content('AB/CD')
    expect(page).to have_content('1873')
    expect(page).to have_content('shoegaze')
    expect(page).to have_content('true')
  end

  it 'User Story 12, Parent Update: Replace some values' do
    acdc = Band.create!(name:'AB/CD', founded:1873, genre:'shoegaze', currently_active:true)

    visit "/bands/#{acdc.id}"

    click_link "Edit Band"

    expect(current_path).to eq("/bands/#{acdc.id}/edit")

    fill_in('Name', with: 'AC/DC')
    fill_in('Genre', with: 'hard rock')

    click_button('Update Band')

    expect(current_path).to eq("/bands/#{acdc.id}")

    expect(page).to have_content('AC/DC')
    expect(page).to have_content('1873')
    expect(page).to have_content('hard rock')
    expect(page).to have_content('true')

    expect(page).to_not have_content('AB/CD')
    expect(page).to_not have_content('shoegaze')
  end
end
