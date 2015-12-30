FactoryGirl.define do
  factory :purchase do
    name "Test"
    registry_number '11111111111'
    email "test@test.com"
    address "Test"
    address_number 12
    city "São Paulo"
    state "SP"
    cep "00000000"
  end
end
