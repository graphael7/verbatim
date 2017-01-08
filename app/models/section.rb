class Section < ApplicationRecord

	belongs_to :speech
	has_many :chunks
end
