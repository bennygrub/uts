class Author < ActiveRecord::Base
	belongs_to :book
	belongs_to :chapter
	belongs_to :journal
end
