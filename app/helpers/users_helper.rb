# frozen_string_literal: true

# UsersHelper
module UsersHelper
  # Returns the gravatar for this user
  def gravatar_for(user, _options = { size: 50 })
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end
end
