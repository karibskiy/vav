module ApplicationHelper
	def title
		if @title
			return @title
		else
			return "Shopping Site"
		end
	end
end
