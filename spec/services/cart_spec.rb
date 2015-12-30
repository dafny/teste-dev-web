require 'rails_helper'

RSpec.describe Cart do
  let!(:purchase) { FactoryGirl.create :purchase }
  let!(:dog) { FactoryGirl.create :dog }
  subject { Cart.new({}, purchase) }

  describe "#cart_dogs_hash" do
    context "empty dogs hash" do
      it { expect(subject.cart_dogs_hash).to eq({}) }
    end

    context "empty dogs hash" do
      before do
        subject.add_dog_to_cart_hash(dog.id)
      end

      it { expect(subject.cart_dogs_hash).to eq({dog.id.to_s=>1}) }
    end
  end

  describe "#add_dog_to_cart_hash" do
    context "dogs hash no have this dog" do
      it "add a dog to hash" do
        subject.add_dog_to_cart_hash(dog.id)
        expect(subject.cart_dogs_hash[dog.id.to_s]).to eq(1)
      end
    end

    context "dogs hash have this dog" do
      before do
        subject.add_dog_to_cart_hash(dog.id)
      end

      it "add one more to quantity" do
        subject.add_dog_to_cart_hash(dog.id)
        expect(subject.cart_dogs_hash[dog.id.to_s]).to eq(2)
      end
    end
  end

  describe "#remove_dog_from_cart" do
    context "has a dog in the hash" do
      before do
        subject.add_dog_to_cart_hash(dog.id)
      end

      it "remove dog from hash" do
        expect(subject.cart_dogs_hash.keys).to include(dog.id.to_s)
        subject.remove_dog_from_cart(dog.id)
        expect(subject.cart_dogs_hash.keys).to_not include(dog.id.to_s)
      end
    end

    context "has not dog in the hash" do
      it "not change hash" do
        expect {
          expect(subject.cart_dogs_hash.keys).to_not include(dog.id.to_s)
          subject.remove_dog_from_cart(dog.id)
          expect(subject.cart_dogs_hash.keys).to_not include(dog.id.to_s)
        }.to_not change(subject, :cart_dogs_hash)
      end
    end
  end

  describe "#clear_purchase_hash" do
    it "remove purchase in session" do
      expect(subject.purchase).to be_a(Purchase)
      subject.clear_purchase_hash
      expect(subject.purchase).to be_nil
    end
  end

  describe "#save_cart" do
    context "has a dog in cart" do
      before do
        subject.add_dog_to_cart_hash(dog.id)
      end

      it "create purchases_dog" do
        expect {
          expect(subject.save_cart).to be_truthy
        }.to change(PurchasesDog, :count).by(1)
      end
    end

    context "has not a dog in cart" do
      it "not create purchases_dog" do
        expect {
          expect(subject.save_cart).to be_truthy
        }.to_not change(PurchasesDog, :count)
      end
    end

    context "has more than one dog in cart" do
      let!(:another_dog) { FactoryGirl.create :dog }

      before do
        subject.add_dog_to_cart_hash(dog.id)
        subject.add_dog_to_cart_hash(another_dog.id)
      end

      it "create more than one purchases_dogs" do
        expect {
          expect(subject.save_cart).to be_truthy
        }.to change(PurchasesDog, :count).by(2)
      end
    end

  end

end
