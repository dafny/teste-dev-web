require 'rails_helper'

RSpec.describe DogsController, type: :controller do

  describe 'GET index' do
    subject { FactoryGirl.create :dog }

    context 'without params' do
      it 'return dogs' do
        get :index
        expect(response).to be_success
        expect(assigns[:dogs]).to include(subject)
      end
    end

    context "with params search" do
      let!(:pug) { FactoryGirl.create :breed, name: "Pug" }
      let!(:other_dog) { FactoryGirl.create :dog, breed: pug }

      it "return dog with this breed" do
        get :index, search: pug.name
        expect(response).to be_success
        expect(assigns[:dogs]).to include(other_dog)
        expect(assigns[:dogs]).to_not include(subject)
      end
    end

  end

  describe 'GET show' do
    subject { FactoryGirl.create :dog }

    it "Return dog with this id" do
      get :show, id: subject.id
      expect(response).to be_success
      expect(assigns[:dog]).to eq(subject)
    end
  end
end
