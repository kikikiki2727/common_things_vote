class Joke < ApplicationRecord
  belongs_to :user
  has_many :votes, dependent: :destroy

  validates :sentence, presence: true
end
