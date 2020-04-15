class Journal < ApplicationRecord
has_many :journal_entries
has_many :users, through: :journal_entries
end
