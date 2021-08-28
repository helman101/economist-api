require 'rails_helper'

RSpec.describe Column, type: :model do
  it { should have_many(:articles) }
end
