require 'faker'

FactoryGirl.define do
  factory :state do
    name {Faker::Name.name}
		acronym {Faker::Address.state_abbr}
  end

end
