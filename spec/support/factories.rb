FactoryGirl.define do
  factory :user do
    username 'goat'
    sequence(:email) {|n| "person#{n}@gmail.com"}
    password 'Password12'
    password_confirmation 'Password12'
  end

  factory :product do
    title 'Title'
    description 'A description'

    user
  end

  factory :review do
    title 'Green Title'
    description 'What an awesome green hue'

    user
    product
  end
end
