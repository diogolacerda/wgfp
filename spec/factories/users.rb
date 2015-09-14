require 'faker'

FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}	
		name {Faker::Name.name}
		password_digest {Faker::Internet.password(8)}
		
  end

end
