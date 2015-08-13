module StaticPagesHelper

	def gravatar_for(name, email)
		gravatar_id = Digest::MD5::hexdigest(email.downcase)
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, alt: name, class: "gravatar")
	end
end
