class User < ActiveRecord::Base
  belongs_to :state
  belongs_to :city
  belongs_to :profile
  belongs_to :civil_state
  belongs_to :nationality
  belongs_to :graduation
  belongs_to :bank

  validates :email, :email => true

  has_secure_password

  validates_presence_of :name, :email

  belongs_to :company_city, :class_name => 'City'

	has_many :users, :foreign_key => 'consultant_id'

  has_and_belongs_to_many :investment_answers
  has_and_belongs_to_many :objectives

end
