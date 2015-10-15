require 'faker'

FactoryGirl.define do
  factory :objective do
    name {Faker::Lorem.sentence}
  end

end
