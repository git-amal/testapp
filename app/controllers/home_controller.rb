class HomeController < ApplicationController
	def index
		unless current_member.blank?
			if current_member.team_member?
				@tasks = Task.where(:member_id=>current_member.id)
			end
		end
	end
end
