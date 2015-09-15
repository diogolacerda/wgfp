require 'faker'

FactoryGirl.define do
  factory :investment_question do
    question {Faker::Hacker.say_something_smart}
  end

end
