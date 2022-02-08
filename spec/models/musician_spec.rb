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

  it 'User Story 15, Child Index only shows `true` Records' do
    beatles = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)
    acdc = Band.create!(name:'AC/DC', founded:1973, genre:'hard rock', currently_active:false)

    john = beatles.musicians.create!(name:'John Lennon', instrument:'guitar, vocals', founding_member:true, born:1940)
    george = beatles.musicians.create!(name:'George Harrison', instrument:'lead guitar, vocals', founding_member:true, born:1943)
    paul = beatles.musicians.create!(name:'Paul McCartney', instrument:'bass, vocals', founding_member:true, born:1942)
    ringo = beatles.musicians.create!(name:'Ringo Starr', instrument:'drums, vocals', founding_member:false, born:1940)

    angus = acdc.musicians.create!(name:'Angus Young', instrument:'lead guitar', founding_member:true, born:1955)
    bon = acdc.musicians.create!(name:'Bon Scott', instrument:'lead vocals', founding_member:true, born:1946)
    malcolm = acdc.musicians.create!(name:'Malcolm Young', instrument:'rhythm guitar', founding_member:true, born:1953)
    brian = acdc.musicians.create!(name:'Brian Johnson', instrument:'lead vocals', founding_member:false, born:1947)
    phil = acdc.musicians.create!(name:'Phil Rudd', instrument:'drums', founding_member:false, born:1954)

    expect(Musician.founders_only.count).to be 6

    expect(Musician.founders_only).to include(john)
    expect(Musician.founders_only).to_not include(ringo)
    expect(Musician.founders_only).to include(angus)
    expect(Musician.founders_only).to_not include(brian)

  end
end
