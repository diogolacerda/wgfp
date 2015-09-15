require 'faker'

FactoryGirl.define do
  factory :objective do
    name {Faker::Name.name}
  end

end
