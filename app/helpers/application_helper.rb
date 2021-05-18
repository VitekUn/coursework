# frozen_string_literal: true

# ApplicationHelper
module ApplicationHelper
  # Returning the full title based on the page title.
  def full_title(page_title = '')
    base_title = 'RoR Sample App'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
