class Book < ActiveRecord::Base
	has_many :book_authors
	accepts_nested_attributes_for :book_authors
end
