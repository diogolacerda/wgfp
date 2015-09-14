class City < ActiveRecord::Base
  belongs_to :state
  has_many :users
  has_many :users, :foreign_key => 'company_city_id'

  validates_presence_of :name


end
