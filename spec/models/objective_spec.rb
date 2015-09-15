require 'rails_helper'

RSpec.describe Objective, type: :model do
  
	it "has a valid factory" do
  	expect(create :objective).to be_valid 
  end	

  it {should validate_presence_of(:name)}

  it {should have_and_belong_to_many(:users)}

end
