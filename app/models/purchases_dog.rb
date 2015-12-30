class PurchasesDog < ActiveRecord::Base
  validates :dog_id, :purchase_id, :quantity, :total_amount, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  belongs_to :dog
  belongs_to :purchase

  before_validation :calculate_total_amount

  private
    def calculate_total_amount
      self.total_amount = dog.amount * quantity
    end
end
