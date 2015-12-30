require 'rails_helper'

RSpec.describe PurchasesDogsController, type: :controller do

  describe "GET #index" do
    it "assigns a new cart as @purchases_dogs" do
      get :index
      expect(assigns(:purchases_dogs)).to be_a(Cart)
    end
  end

  describe "GET #add_to_cart" do
    subject { FactoryGirl.create :dog }

    it "add more one dog do cart" do
      get :add_to_cart, dog_id: subject.id
      expect(Cart.new(session).cart_dogs_hash[subject.id.to_s]).to eq(1)
    end
  end

  describe "POST #create" do
    let!(:dog) { FactoryGirl.create :dog }
    let!(:purchase) { FactoryGirl.create :purchase }

    it "create new purchases_dogs" do
      expect {
        Cart.new(session, purchase.id.to_s).add_dog_to_cart_hash(dog.id.to_s)
        post :create

        expect(PurchasesDog.first).to_not be_nil
        expect(response.status).to eql(302)

      }.to change(PurchasesDog, :count).by(1)
    end

    context "with invalid params" do
      it "not create without purchase" do
        expect {
          Cart.new(session).add_dog_to_cart_hash(dog.id.to_s)
          post :create
        }.to_not change(PurchasesDog, :count)
      end

    end
  end
end
