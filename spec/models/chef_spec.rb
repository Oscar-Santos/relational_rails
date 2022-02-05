require 'rails_helper'

RSpec.describe Chef do
  describe 'validation' do
    it { should validate_presence_of :name }
    end

    describe 'relationships' do
      it { should have_many :entrees }
    end

    describe 'class methods ' do
      describe '#order_by_creation' do
        it 'orders chefs by created at' do
          chef_1 = Chef.create!(name: 'Jose Beltran', age: 45, is_male: true, years_employed: 8, created_at: 10.seconds.ago)
          chef_2 = Chef.create!(name: 'Gaston Acurio', age: 39, is_male: true, years_employed: 11, created_at: 15.seconds.ago)
          chef_3 = Chef.create!(name: 'Lena Rojas', age: 29, is_male: false, years_employed: 8, created_at: 20.seconds.ago)

          expected = [chef_1, chef_2, chef_3]

          expect(Chef.order_by_creation).to eq(expected)
        end
      end
    end
end
