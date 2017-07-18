class Business < ApplicationRecord
	belongs_to :user
	has_many :likes
	has_many :catergories
	
end
