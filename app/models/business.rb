class Business < ApplicationRecord
	belongs_to :user
	has_many :likes
	belongs_to :catergory

end
