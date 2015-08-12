class Equipment < ActiveRecord::Base
	before_save { self.tag.downcase! }
	validates :name, presence: true, 
					length: { maximum: 50 }

	VALID_TAG_REGEX = /\A[a-zA-Z]\d\z/i
	validates :tag, presence: true,
					length: { maximum: 2 },
					format: { with: VALID_TAG_REGEX },
					uniqueness: { case_sensitive: false }

	validates :status, presence: true,
					inclusion: { in: [true, false] },
					exclusion: { in: [nil] }

end
