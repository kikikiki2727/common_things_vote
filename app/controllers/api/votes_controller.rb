class Api::VotesController < ApplicationController
  def index
    votes = Vote.all
    render json: votes
  end
  
  def create
    joke = Joke.find(params[:joke_id])
    vote = joke.votes.create!
    render json: vote
  end

  def destroy
    vote = Vote.find(params[:id])
    vote.destroy!
    render json: vote
  end
end
