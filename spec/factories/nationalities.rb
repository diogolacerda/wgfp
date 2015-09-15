require 'faker'

FactoryGirl.define do
  factory :nationality do
    name {Faker::Name.name}
  end

end
