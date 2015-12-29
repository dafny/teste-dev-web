class CreateBreeds < ActiveRecord::Migration
  def change
    create_table :breeds do |t|
      t.string :name

      t.timestamps null: false
    end

    rename_column :dogs, :breed, :breed_id
    change_column :dogs, :breed_id, 'integer USING CAST(breed_id AS integer)'
  end
end
