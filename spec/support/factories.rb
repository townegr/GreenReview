FactoryGirl.define do
  factory :user do
    username 'goat'
    sequence(:email) {|n| "person#{n}@gmail.com"}
    password 'password1'
  end

  factory :product do
    title 'Title'
    description 'A description'
  end
end
