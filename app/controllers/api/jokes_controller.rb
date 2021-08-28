class Api::JokesController < ApplicationController
  def index
    jokes = Joke.all
    render json: jokes
  end

  def create
    joke = Joke.new(joke_params)

    if joke.save
      render json: joke
    else
      render json: joke.errors, status: :bad_request
    end
  end

  def destroy
    joke = Joke.find(params[:id])
    joke.destroy!
    render json: joke
  end

  private

  def joke_params
    params.require(:joke).permit(:sentence)
  end
end
