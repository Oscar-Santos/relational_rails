require 'rails_helper'

RSpec.describe Musician, type: :model do
  it { should validate_presence_of :name }
  it { should belong_to :band }
end
