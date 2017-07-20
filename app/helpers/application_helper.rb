module ApplicationHelper

	def has_user_liked likes
		likes.where(user_id: current_user.id).exists?
	end

end
