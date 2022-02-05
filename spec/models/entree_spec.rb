require 'rails_helper'

RSpec.describe Entree do
  # describe 'validation' do
  #   it { should validate_presence_of :name }
  #   end

  describe 'relationships' do
    it { should belong_to :chef}
  end
end
