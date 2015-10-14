class User < ActiveRecord::Base

  attr_accessor :skip_validate_pass
  attr_accessor :step

  belongs_to :state
  belongs_to :city
  belongs_to :profile
  belongs_to :civil_state
  belongs_to :nationality
  belongs_to :graduation
  belongs_to :bank

  validates :email, :email => true

  has_secure_password

  validates_presence_of :name, :email, :profile_id

  belongs_to :company_city, :class_name => 'City'

  belongs_to :consultant, :class_name => 'User'

  has_many :users, :foreign_key => 'consultant_id'

  has_and_belongs_to_many :investment_answers
  has_and_belongs_to_many :objectives

  validates :email, :email => true, :uniqueness => true

  validates_length_of :password, :minimum => 6, if: Proc.new { |user| user.skip_validate_pass != true }

  # --- Conditional Validation --- #

  #Step 1
  validates_presence_of :email_secondary, 
    :celphone, 
    :birthday, 
    :civil_state_id, 
    :nationality_id, 
    :profession,
    :cpf,
    :rg,
    :issuer,
    :zip_code,
    :street,
    :state_id,
    :city_id,
    :district, if: Proc.new { |user| user.step.to_i == 1 }

end
