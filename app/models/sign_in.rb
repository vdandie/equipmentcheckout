class SignIn < ActiveRecord::Base
	belongs_to :admin, class_name: "Admin"
	belongs_to :request, class_name: "Request"
	validates :admin_id, presence: true
	validates :request_id, presence: true
end
