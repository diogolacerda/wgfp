require 'faker'

FactoryGirl.define do
  factory :civil_state do
    name {Faker::Name.name}

    trait :casado do
    	id 1
    	name "Casado"
    end
    trait :solteiro do
    	id 2
    	name "Solteiro"
    end

  end

end
