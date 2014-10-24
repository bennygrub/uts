class Journal < ActiveRecord::Base
	has_many :journal_authors
	accepts_nested_attributes_for :journal_authors
end
