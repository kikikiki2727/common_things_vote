class Api::JokesController < ApplicationController
  def index
    jokes = Joke.includes(:user)
    render json: jokes
  end

  def create
    joke = current_user.jokes.build(joke_params)

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
