require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do

  let!(:dog) { FactoryGirl.create(:dog) }
  let(:valid_attributes) do
    {
      dog_id: dog.id,
      quantity: 1,
      name: "Test",
      registry_number: '11111111111',
      email: "test@test.com",
      address: "Test",
      address_number: 12,
      city: "São Paulo",
      state: "SP",
      cep: "00000000"
    }
  end

  describe "GET #new" do
    it "assigns a new purchase as @purchase" do
      get :new, dog_id: dog.id
      expect(assigns(:purchase)).to be_a_new(Purchase)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Purchase" do
        expect {
          post :create, dog_id: dog.id, purchase: valid_attributes

          expect(Purchase.first).to_not be_nil
          expect(response.status).to eql(302)

        }.to change(Purchase, :count).by(1)
      end

      it "assigns a newly created purchase as @purchase" do
        post :create, dog_id: dog.id, purchase: valid_attributes
        expect(assigns(:purchase)).to be_a(Purchase)
        expect(assigns(:purchase)).to be_persisted
      end

    end

    context "with invalid params" do
      it "assigns a newly created but unsaved purchase as @purchase" do
        expect {
          post :create, dog_id: dog.id, purchase: valid_attributes.except(:name)

          expect(assigns(:purchase)).to be_a_new(Purchase)
          expect(response.status).to_not eql(302)

        }.to_not change(Purchase, :count)
      end

      it "re-renders the 'new' template" do
        post :create, dog_id: dog.id, purchase: valid_attributes.except(:name)
        expect(response).to render_template("new")
      end
    end
  end

end
