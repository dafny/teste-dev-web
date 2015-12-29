class CreateDogs < ActiveRecord::Migration
  def change
    create_table :dogs do |t|
      t.string :breed
      t.string :color
      t.float :amount, precision: 2, scale: 10
      t.integer :age

      t.timestamps null: false
    end
  end
end
