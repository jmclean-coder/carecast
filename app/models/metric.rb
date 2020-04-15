class Metric < ApplicationRecord
has_many :user_metrics
has_many :users, through: :user_metrics
end
