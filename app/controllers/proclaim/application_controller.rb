class Proclaim::ApplicationController < ApplicationController
	include Pundit

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private

	def user_not_authorized
		flash[:error] = "You are not authorized to perform this action."
		redirect_to(request.referrer || root_path)
	end

	def authenticate_author
		begin
			send(Proclaim.authentication_method)
		rescue NoMethodError
			raise "Proclaim doesn't know how to authenticate users! Please" \
			      " ensure that `Proclaim.authentication_path` is valid."
		end
	end

	def current_author
		begin
			send(Proclaim.current_author_method)
		rescue NoMethodError
			raise "Proclaim doesn't know how to get the current author! Please" \
			      " ensure that `Proclaim.current_author_method` is valid."
		end
	end

	def pundit_user
		current_author
	end

	def image_id_and_name_from_url(url)
		match = url.match(/([^\/]*?)\/([^\/]*)\z/)

		return match[1], match[2]
	end

	def cache_name_from_url(url)
		url.match(/[^\/]*?\/[^\/]*\z/)
	end
end