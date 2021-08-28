class Joke < ApplicationRecord
  belongs_to :user

  validates :sentence, presence: true
end
