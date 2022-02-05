require 'rails_helper'

RSpec.describe Chef do
  describe 'validation' do
    it { should validate_presence_of :name }
    end

    describe 'relationships' do
      it { should have_many :entrees }
    end
end
