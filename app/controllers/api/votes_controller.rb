class Api::VotesController < ApplicationController
  def index
    votes = Vote.all
    render json: votes
  end

  def create
    joke = Joke.find(params[:joke_id])
    vote = joke.votes.create!
    count = joke.vote_count + 1
    joke.update!(vote_count: count)
    render json: vote
  end
end
