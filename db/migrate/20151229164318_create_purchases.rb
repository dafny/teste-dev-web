class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :dog, index: true, foreign_key: true
      t.integer :quantity
      t.string :name
      t.string :registry_number
      t.string :email
      t.string :address
      t.string :address_number
      t.string :complement
      t.string :city
      t.string :state
      t.string :cep

      t.timestamps null: false
    end
  end
end
