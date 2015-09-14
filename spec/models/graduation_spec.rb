require 'rails_helper'

RSpec.describe Graduation, type: :model do
  
	it "has a valid factory" do
  	expect(create :graduation).to be_valid 
  end	

  it {should validate_presence_of(:name)}

  it {should have_many(:users)}

end
