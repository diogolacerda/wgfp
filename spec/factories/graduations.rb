require 'faker'

FactoryGirl.define do
  factory :graduation do
    name {Faker::Name.name}
  end

end
