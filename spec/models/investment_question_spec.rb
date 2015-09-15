require 'rails_helper'

RSpec.describe InvestmentQuestion, type: :model do
  
	it "has a valid factory" do
  	expect(create :investment_question).to be_valid 
  end

  it {should validate_presence_of(:question)}

  it {should have_many(:investment_answers)}

end
