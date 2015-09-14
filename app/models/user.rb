class User < ActiveRecord::Base
  belongs_to :state
  belongs_to :city
  belongs_to :profile
  belongs_to :civil_state
  belongs_to :nationality
  belongs_to :graduation

  validates :email, :email => true

  has_secure_password

  validates_presence_of :name, :email

  belongs_to :company_city_id, :class_name => 'City'
	has_many :users, :foreign_key => 'consultant_id'


end
