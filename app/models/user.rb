class User < ActiveRecord::Base
	has_many :allergy
	has_many :disease
	has_many :remedy
	validates_uniqueness_of :email
	#accepts_nested_attributes_for :email, :sangue, :peso, :altura, :pressao
end
