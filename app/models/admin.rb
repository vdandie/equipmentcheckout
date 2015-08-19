class Admin < ActiveRecord::Base
	has_many :active_sign_outs, class_name: "SignOut",
								foreign_key: "admin_id",
								dependent: 	:destroy
	has_many :signed_out, through: :active_sign_outs, source: :request

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

	# Signs Out a Request
	def sign_out(request)
		active_sign_outs.create(request_id: request.id)
		@equipment = request.equipment
		@equipment.update_attribute :status, false
		@equipment.save
	end

	# Undos a sign out on a request
	def undo_sign_out(a_request)
		@equipment = a_request.equipment
		@equipment.update_attribute :status, true
		@equipment.save
		active_sign_outs.find_by(request_id: a_request.id).destroy
	end

	# Returns true if current admin signed out request
	def signed_out?(request)
		signed_out.include?(request)
	end
end
