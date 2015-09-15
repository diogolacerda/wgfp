class InvestmentQuestion < ActiveRecord::Base

	validates_presence_of :question
	has_many :investment_answers

end
