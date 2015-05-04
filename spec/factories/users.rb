FactoryGirl.define do
  factory :user do
    name { TubularFaker.name }
    password "1234"
  end
end
