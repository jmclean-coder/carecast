class Journal < ApplicationRecord
has_many :journal_entries, dependent: :destroy
has_many :users, through: :journal_entries
end
