require 'faker'

FactoryGirl.define do
  factory :investment_answer do
    answer {Faker::Hacker.say_something_smart}
  end

end
