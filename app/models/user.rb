require 'bcrypt'

class User < ActiveRecord::Base
	# ** The method below does EVERYTHING we have had in user.rb for us, 
	# ** but we must be expected to KNOW the long hand

	#------ rails built-in Authentication method ------
  has_secure_password

  def self.confirm(email_param, password_param)
    user = User.find_by({email: email_param})
    if user
    	user.authenticate(password_param)
    else
    	false
    end
  end

 	#------ end of method ------ #


	## Engine.cost = 12 is a computational workfactor
	## Set's the number of rounds you are algorithmically mixing up a value(pw)
	## Higher number also means longer time it's running
	# BCrypt::Engine.cost = 12

	# getter method; read password 
	# attr_reader :password
	# # Creates a GETTER & SETTER and CONFIRMS password
	# validates_confirmation_of :password
	# # password_digest is the hashed password created via bcrypt
	# validates_presence_of :password_digest

	# # Basically, we are checking their ID
	# def authenticate(unencrypted_password)
	# 	if BCrypt::Password.new(password_digest) == unencrypted_password
	# 		# If the above passes, self means we return the user.  (the instance of User)
	# 		self
	# 	else
	# 		false
	# 	end
	# end

	# # setter method; taking in a value and setting it equal to password 
	# def password=(unencrypted_password)
	# 	if unencrypted_password.nil?
	# 		## when nil password_digest is nil
	# 		## if we say User.new, self refers to that instance of the User class
	# 		self.password_digest = nil
	# 	else
	# 		@password = unencrypted_password
	# 		## update password_digest using a hashing algorithm
	# 		self.password_digest = BCrypt::Password.create(@password)
	# 	end
	# end

	# ## authenticates the user email & password
	# def self.confirm(email_param, password_param)
	# 	# it just takes in a user and finds them by their email
	# 	user = User.find_by({email: email_param})
	# 	# when it finds their email, it authenticates/confirms the user
	# 	if user
	# 		user.authenticate(password_param)
	# 	else
	# 		false
	# 	end
	# end
end
