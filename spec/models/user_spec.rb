require 'rails_helper'

RSpec.describe User, type: :model do
  
	it "has a valid factory" do
  	expect(create :user).to be_valid 
  end

  it { should allow_value('aaa@aaa.aaa').for(:email) }
	it { should_not allow_value('aaa').for(:email) }

  it { should have_secure_password } 
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }

  it { should belong_to(:profile)}
  it { should belong_to(:state)}
  it { should belong_to(:city)}
  it { should belong_to(:graduation)}
  it { should belong_to(:civil_state)}
  it { should belong_to(:nationality)}
  it { should belong_to(:bank)}

  it {should belong_to(:company_city).class_name('City')}

  it {should have_and_belong_to_many(:investment_answers)}
  it {should have_and_belong_to_many(:objectives)}

  it { should have_many(:users).with_foreign_key('consultant_id')}

end
