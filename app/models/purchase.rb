class Purchase < ActiveRecord::Base
  validates :name, :registry_number, :email, :address, :address_number, :city, :state, :cep, presence: true

  has_many :purchases_dogs

  attr_accessor :dog_id
end
