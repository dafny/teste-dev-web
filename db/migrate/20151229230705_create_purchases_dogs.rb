class CreatePurchasesDogs < ActiveRecord::Migration
  def change
    create_table :purchases_dogs do |t|
      t.references :dog, index: true, foreign_key: true
      t.references :purchase, index: true, foreign_key: true
      t.integer :quantity
      t.float :total_amount

      t.timestamps null: false
    end

    remove_reference :purchases, :dog
    remove_column :purchases, :quantity
  end
end
