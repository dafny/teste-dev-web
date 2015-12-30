require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it { expect have_many(:purchases_dogs) }
  it { expect validate_presence_of(:name) }
  it { expect validate_presence_of(:registry_number) }
  it { expect validate_presence_of(:email) }
  it { expect validate_presence_of(:address) }
  it { expect validate_presence_of(:address_number) }
  it { expect validate_presence_of(:city) }
  it { expect validate_presence_of(:state) }
  it { expect validate_presence_of(:cep) }
end
