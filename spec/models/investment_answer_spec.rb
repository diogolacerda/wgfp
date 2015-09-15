require 'rails_helper'

RSpec.describe InvestmentAnswer, type: :model do
  
  it "has a valid factory" do
  	expect(create :investment_answer).to be_valid 
  end	

  it {should validate_presence_of(:answer)}

  it {should belong_to(:investment_question)}

  it {should have_and_belong_to_many(:users)}

end
