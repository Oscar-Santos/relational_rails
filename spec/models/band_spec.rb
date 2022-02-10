require 'rails_helper'

RSpec.describe Band, type: :model do
  it { should validate_presence_of :name }
  it { should have_many :musicians }

  it 'User Story 6, Parent Index sorted by Most Recently Created' do
    @band_1 = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)
    @band_2 = Band.create!(name:'The Beatles', founded:1960, genre:'rock & roll', currently_active:false)
    @band_3 = Band.create!(name:'AC/DC', founded:1973, genre:'hard rock', currently_active:false)

    # expect(Band.sort).to eq(['AC/DC', 'The Beatles', 'Metallica'])
    expect(Band.sort).to eq([@band_3, @band_2, @band_1])
  end

  it 'User Story 16, Sort Parents Children in Alphabetical Order by name' do
    metallica = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)

    cliff = metallica.musicians.create!(name:'Cliff Burton', instrument:'bass', founding_member:false, born:1962)
    kirk = metallica.musicians.create!(name:'Kirk Hammett', instrument:'lead guitar', founding_member:false, born:1962)
    james = metallica.musicians.create!(name:'James Hetfield', instrument:'rhythm guitar, lead vocals', founding_member:true, born:1963)
    lars = metallica.musicians.create!(name:'Lars Ulrich', instrument:'drums', founding_member:true, born:1963)

    # sorted = Band.sort_members(metallica)
    sorted = metallica.sort_members

    expect(sorted).to eq([cliff, james, kirk, lars])
  end

  it 'User Story 21, Display Records that meet a Given Condition' do
    metallica = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)

    cliff = metallica.musicians.create!(name:'Cliff Burton', instrument:'bass', founding_member:false, born:1962)
    kirk = metallica.musicians.create!(name:'Kirk Hammett', instrument:'lead guitar', founding_member:false, born:1962)
    james = metallica.musicians.create!(name:'James Hetfield', instrument:'rhythm guitar, lead vocals', founding_member:true, born:1963)
    lars = metallica.musicians.create!(name:'Lars Ulrich', instrument:'drums', founding_member:true, born:1963)

    filtered = metallica.filter(1963)

    expect(filtered).to eq([cliff, kirk])
  end

  it 'US21: filter removes nothing when the argument is nil' do
    metallica = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)

    cliff = metallica.musicians.create!(name:'Cliff Burton', instrument:'bass', founding_member:false, born:1962)
    kirk = metallica.musicians.create!(name:'Kirk Hammett', instrument:'lead guitar', founding_member:false, born:1962)
    james = metallica.musicians.create!(name:'James Hetfield', instrument:'rhythm guitar, lead vocals', founding_member:true, born:1963)
    lars = metallica.musicians.create!(name:'Lars Ulrich', instrument:'drums', founding_member:true, born:1963)

    filtered = metallica.filter

    expect(filtered).to eq([cliff, james, kirk, lars])
  end

  it 'US21: filter also sorts by name' do
    metallica = Band.create!(name:'Metallica', founded:1981, genre:'metal', currently_active:true)

    kirk = metallica.musicians.create!(name:'Kirk Hammett', instrument:'lead guitar', founding_member:false, born:1962)
    cliff = metallica.musicians.create!(name:'Cliff Burton', instrument:'bass', founding_member:false, born:1962)
    james = metallica.musicians.create!(name:'James Hetfield', instrument:'rhythm guitar, lead vocals', founding_member:true, born:1963)
    lars = metallica.musicians.create!(name:'Lars Ulrich', instrument:'drums', founding_member:true, born:1963)

    filtersort = metallica.filter(1963)

    expect(filtersort).to eq([cliff, kirk])
  end
end
