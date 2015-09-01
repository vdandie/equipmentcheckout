class Equipment < ActiveRecord::Base
	has_many :requests, dependent: :destroy
	before_save { self.tag.downcase! }
	default_scope -> { order(tag: :asc) }
	validates :name, presence: true, 
					length: { maximum: 50 }

	VALID_TAG_REGEX = /\A[a-zA-Z]+\d+\z/i
	validates :tag, presence: true,
					length: { maximum: 8 },
					format: { with: VALID_TAG_REGEX },
					uniqueness: { case_sensitive: false }

	validates :status, presence: true
	validates_numericality_of :status, greater_than: 0, less_than: 3

	def name_with_tag
    	"#{tag}:#{name}"
	end

	def set_to_out
		status = 1
	end
end
