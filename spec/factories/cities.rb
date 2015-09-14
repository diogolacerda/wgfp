require 'faker'

FactoryGirl.define do
  factory :city do
    name {Faker::Name.name}
  end

end
