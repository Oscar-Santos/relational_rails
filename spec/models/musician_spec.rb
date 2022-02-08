require 'rails_helper'

RSpec.describe Musician, type: :model do
  it { should validate_presence_of :name }
  it { should belong_to :band }

  it 'User Story 7, Parent Child Count' do
    beatles = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)

    beatles.musicians.create!(name:'John Lennon', instrument:'guitar, vocals', founding_member:true, born:1940)
    beatles.musicians.create!(name:'George Harrison', instrument:'lead guitar, vocals', founding_member:true, born:1943)
    beatles.musicians.create!(name:'Paul McCartney', instrument:'bass, vocals', founding_member:true, born:1942)

    expect(Musician.bandmate_count(beatles.id)).to be 3
  end
end
