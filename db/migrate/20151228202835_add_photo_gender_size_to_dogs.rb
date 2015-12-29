class AddPhotoGenderSizeToDogs < ActiveRecord::Migration
  def change
    add_attachment :dogs, :photo
    add_column :dogs, :gender, :string
    add_column :dogs, :size, :string
  end
end
