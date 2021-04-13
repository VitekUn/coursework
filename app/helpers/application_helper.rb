module ApplicationHelper

	# Возвращаем полный заголовок на основе заголовка страницы.
	def full_title(page_title = '')
		base_title = "RoR Sample App"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end
end
