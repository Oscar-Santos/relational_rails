require 'rails_helper'

RSpec.describe 'the bands#update feature' do

  it 'User Story 14, Child Update: Replace all values' do
    beatles = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)
    george = beatles.musicians.create!(name:'Greg Harris', instrument:'kazoo, vocals', founding_member:false, born:2043)

    visit "/musicians/#{george.id}"

    click_link "Edit Musician"

    expect(current_path).to eq("/musicians/#{george.id}/edit")

    fill_in('Name', with: 'George Harrison')
    fill_in('Instrument', with: 'lead guitar, vocals')
    fill_in('Founding Member', with: 'true')
    fill_in('Year Born', with: '1943')

    click_button('Update Musician')

    expect(current_path).to eq("/musicians/#{george.id}")

    expect(page).to have_content('George Harrison')
    expect(page).to have_content('lead guitar, vocals')
    expect(page).to have_content('true')
    expect(page).to have_content('1943')

    expect(page).to_not have_content('Greg Harris')
    expect(page).to_not have_content('kazoo, vocals')
    expect(page).to_not have_content('false')
    expect(page).to_not have_content('2043')
  end

  it 'User Story 14, Child Update: Replace no values' do
    beatles = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)
    george = beatles.musicians.create!(name:'Greg Harris', instrument:'kazoo, vocals', founding_member:false, born:2043)

    visit "/musicians/#{george.id}"

    click_link "Edit Musician"

    expect(current_path).to eq("/musicians/#{george.id}/edit")

    click_button('Update Musician')

    expect(current_path).to eq("/musicians/#{george.id}")

    expect(page).to have_content('Greg Harris')
    expect(page).to have_content('kazoo, vocals')
    expect(page).to have_content('false')
    expect(page).to have_content('2043')


  end

  it 'User Story 14, Child Update: Replace some values' do
    beatles = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)
    george = beatles.musicians.create!(name:'Greg Harris', instrument:'kazoo, vocals', founding_member:false, born:2043)

    visit "/musicians/#{george.id}"

    click_link "Edit Musician"

    expect(current_path).to eq("/musicians/#{george.id}/edit")

    fill_in('Name', with: 'George Harrison')
    fill_in('Founding Member', with: 'true')

    click_button('Update Musician')

    expect(current_path).to eq("/musicians/#{george.id}")

    expect(page).to have_content('George Harrison')
    expect(page).to have_content('kazoo, vocals')
    expect(page).to have_content('true')
    expect(page).to have_content('2043')

    expect(page).to_not have_content('Greg Harris')
    expect(page).to_not have_content('false')
  end
end
