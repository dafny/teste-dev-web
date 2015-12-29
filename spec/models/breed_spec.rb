require 'rails_helper'

RSpec.describe Breed, type: :model do
  it { expect have_many(:dogs) }
  it { expect validate_presence_of(:name) }
end
