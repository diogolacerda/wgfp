require 'faker'

FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}	
		name {Faker::Name.name}
		password {Faker::Internet.password(8)}
		activation_token SecureRandom.urlsafe_base64
		is_activated true
		is_blocked false

		trait :blocked do
			is_blocked true
		end

		trait :not_activated do
			is_activated false
		end
		
		trait :incomplete_register do

			email_secondary ""
			cpf ""
			rg ""
			issuer ""
			celphone ""
			birthday ""
			civil_state nil
			nationality nil
			profession ""
			zip_code ""
			street ""
			district ""
			city nil
			state nil
			graduation nil
			father ""
			mother ""
			bank nil
			agency ""
			account ""

		end

		trait :complete_register do

			email_secondary {Faker::Internet.email}	
			cpf {Faker::CPF.pretty}
			rg "MG 12.231.232"
			issuer {Faker::Address.state_abbr}
			celphone {Faker::PhoneNumber.cell_phone}
			birthday {Faker::Date.between(7.days.ago, Date.today)}
			association :civil_state
			association :nationality
			profession {Faker::Company.buzzword}
			zip_code {Faker::Address.zip_code}
			street {Faker::Address.street_address}
			district {Faker::Address.city}
			association :city
			association :state
			association :graduation
			father {Faker::Name.name}
			mother {Faker::Name.name}
			association :bank
			agency {Faker::Number.number(4)}
			account {Faker::Number.number(6)}

		end

  end

end
