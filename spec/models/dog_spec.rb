require 'rails_helper'

RSpec.describe Dog, type: :model do
  it { expect belong_to(:breed) }
  it { expect have_many(:purchases_dogs) }
  it { expect validate_presence_of(:breed_id) }
  it { expect validate_presence_of(:color) }
  it { expect validate_presence_of(:amount) }
  it { expect validate_presence_of(:age) }
  it { expect validate_presence_of(:gender) }
  it { expect validate_presence_of(:size) }
  it { expect validate_presence_of(:photo) }

  describe ".search" do
    let!(:pug) { FactoryGirl.create :breed, name: "Pug" }
    let!(:beagle) { FactoryGirl.create :breed, name: "Beagle" }
    let!(:first_dog) { FactoryGirl.create :dog, breed: pug }
    let!(:second_dog) { FactoryGirl.create :dog, breed: beagle }

    context 'No have params' do
      it "return all dogs" do
        expect(Dog.search(nil)).to include(first_dog)
        expect(Dog.search(nil)).to include(second_dog)
      end

      context "Have params" do
        it "Return dog with this breed" do
          expect(Dog.search(pug.name)).to include(first_dog)
          expect(Dog.search(pug.name)).to_not include(second_dog)
        end
      end
    end

  end
end
