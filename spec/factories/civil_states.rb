require 'faker'

FactoryGirl.define do
  factory :civil_state do
    name {Faker::Name.name}
  end

end
