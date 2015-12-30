require 'rails_helper'

RSpec.describe PurchasesDog, type: :model do
  it { expect belong_to(:dog) }
  it { expect belong_to(:purchase) }
  it { expect validate_presence_of(:dog_id) }
  it { expect validate_presence_of(:quantity) }
  it { expect validate_presence_of(:total_amount) }
  it { expect validate_numericality_of(:quantity) }

  describe "calculate_total_amount" do
    subject { FactoryGirl.build :purchases_dog }

    it "set total amount to purchases dog" do
      expect {
        subject.save
        expect(subject.total_amount).to eq(dog.amount)
      }
    end
  end
end
