class Business < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :likes
	

   mount_uploader :logo, ImageUploader

end
