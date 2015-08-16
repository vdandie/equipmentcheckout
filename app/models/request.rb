class Request < ActiveRecord::Base
  belongs_to :equipment
  before_save { self.email.downcase! }
  default_scope -> { order(created_at: :desc) }
  VALID_NAME_REGEX = /\A[\p{L}\s'.-]+\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_SID_REGEX = /\A(907)+(\d{6})\z/
  validates :equipment_id, presence: true
  validates :name, presence: true,
					length: { maximum: 100 },
					format: { with: VALID_NAME_REGEX }
  validates :email, presence: true,
					length: { maximum: 100 },
					format: { with: VALID_EMAIL_REGEX }
	validates :sid, presence: true,
					length: { minimum: 9, maximum: 9},
					format: { with: VALID_SID_REGEX }
end
