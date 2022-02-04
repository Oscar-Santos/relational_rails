require 'rails_helper'

RSpec.describe Band, type: :model do
  it { should validate_presence_of :name }
  it { should have_many :musicians }
end
