require 'rails_helper'

RSpec.describe City, type: :model do
  
	it "has a valid factory" do
  	expect(create :city).to be_valid 
  end	

  it {should validate_presence_of(:name)}

  it {should belong_to(:state)}
  it {should have_many(:users)}
  it { should have_many(:users).with_foreign_key('company_city_id')}

end
