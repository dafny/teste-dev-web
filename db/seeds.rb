# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

["Pug", "Beagle", "Pastor Alemão", "São Bernardo"].each do |breed|
  b = Breed.where(name: breed).first_or_create

  case b.name
  when "Pug"
    dog = Dog.where(breed_id: b.id).first_or_initialize
    dog.color = "Branco"
    dog.amount = 500.0
    dog.age = 1
    dog.gender = Dog.genders[:m]
    dog.size = Dog.sizes[:mini]
    file = File.open('app/assets/images/pug.jpg')
    dog.photo = file
    file.close
    dog.save
  when "Beagle"
    dog = Dog.where(breed_id: b.id).first_or_initialize
    dog.color = "Marrom"
    dog.amount = 200.0
    dog.age = 2
    dog.gender = Dog.genders[:f]
    dog.size = Dog.sizes[:small]
    file = File.open('app/assets/images/beagle.jpg')
    dog.photo = file
    file.close
    dog.save
  when "Pastor Alemão"
    dog = Dog.where(breed_id: b.id).first_or_initialize
    dog.color = "Preto"
    dog.amount = 800.0
    dog.age = 0
    dog.gender = Dog.genders[:f]
    dog.size = Dog.sizes[:medium]
    file = File.open('app/assets/images/pastor.jpg')
    dog.photo = file
    file.close
    dog.save
  when "São Bernardo"
    dog = Dog.where(breed_id: b.id).first_or_initialize
    dog.color = "Branco e Marrom"
    dog.amount = 300.0
    dog.age = 1
    dog.gender = Dog.genders[:m]
    dog.size = Dog.sizes[:big]
    file = File.open('app/assets/images/bernardo.jpg')
    dog.photo = file
    file.close
    dog.save
  end

end
