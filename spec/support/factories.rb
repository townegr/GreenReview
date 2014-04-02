FactoryGirl.define do
  factory :user do
    username 'goat'
    sequence(:email) {|n| "person#{n}@gmail.com"}
    password '12345678'
  end
end
