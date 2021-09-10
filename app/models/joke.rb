class Joke < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy

  validates :sentence, presence: true

  scope :sort_votes, -> { sort { |a, b| b.votes.count <=> a.votes.count } }
end
