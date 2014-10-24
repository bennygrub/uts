class Chapter < ActiveRecord::Base
	has_many :chapter_authors
	accepts_nested_attributes_for :chapter_authors
end
