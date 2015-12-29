FactoryGirl.define do
  factory :dog do
    breed
    color "Branco"
    amount 100.0
    age 1
    gender "Macho"
    size "Mini"
    photo File.open('app/assets/images/bernardo.jpg')
  end
end
