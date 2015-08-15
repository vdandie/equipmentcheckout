class Admin < ActiveRecord::Base
	before_save { self.email.downcase! }
	VALID_NAME_REGEX = /\A[\p{L}\s'.-]+\z/
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_PASSWORD_REGEX = /\A.{4,8}\z/
	validates :name, presence: true,
					length: { maximum: 100 },
					format: { with: VALID_NAME_REGEX }
	validates :email, presence: true,
					length: { maximum: 100 },
					format: { with: VALID_EMAIL_REGEX },
					uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, presence: true,
						length: { minimum: 4, maximum: 8 },
						format: { with: VALID_PASSWORD_REGEX }

	# Returns the hash digest of the given string.
	def Admin.digest(string)
		cost = 	ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
														BCrypt::Engine.cost
		BCrypt::Password.create(string, cost: cost)
	end
end
