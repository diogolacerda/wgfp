class InvestmentAnswer < ActiveRecord::Base
  belongs_to :investment_question

  validates_presence_of :answer

  has_and_belongs_to_many :users

end
