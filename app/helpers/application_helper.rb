module ApplicationHelper
	def icon(style)
		"<span class='glyphicon glyphicon-#{style}'></span>".html_safe
	end
end
