class Breed < ActiveRecord::Base
  validates :name, presence: true

  has_many :dogs
end
