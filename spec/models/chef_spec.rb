require 'rails_helper'

RSpec.describe Chef do
  describe 'validation' do
    it { should validate_presence_of :name }
  end
end
