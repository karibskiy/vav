module SessionsHelper

	def sign_in(user)
	    remember_token = User.new_remember_token
	    cookies.permanent[:remember_token] = remember_token
	    user.update_attribute(:remember_token, User.digest(remember_token))
	    self.current_user = user
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.digest(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end
  	def signed_in?

    	!current_user.nil?
  	end
  	def sign_out
	    current_user.update_attribute(:remember_token,
	                            User.digest(User.new_remember_token))
	    cookies.delete(:remember_token)
	    self.current_user = nil
  	end


  	def User.new_remember_token
	    SecureRandom.urlsafe_base64
	end

	def User.digest(token)
	Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
		  self.remember_token = User.digest(User.new_remember_token)
		end
end
