class Joke < ApplicationRecord
  belongs_to :user
  has_many :votes

  validates :sentence, presence: true
end
