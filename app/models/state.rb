class State < ActiveRecord::Base

	has_many :cities
	has_many :users
	has_many :users, :foreign_key => 'company_state_id'
	validates_presence_of :name



end
