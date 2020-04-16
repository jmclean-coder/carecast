class User < ApplicationRecord
has_many :user_metrics, dependent: :destroy
has_many :metrics, through: :user_metrics
has_many :user_meals, dependent: :destroy
has_many :meals, through: :user_meals
has_many :journal_entries, dependent: :destroy 
has_many :journals, through: :journal_entries
end
