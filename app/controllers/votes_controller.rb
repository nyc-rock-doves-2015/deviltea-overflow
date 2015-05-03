class VotesController < ApplicationController

  def create
    vote = Vote.new(vote_params)
    vote.save
    render json: vote.tally.to_json
  end

  private

  def vote_params
    params[:vote][:user_id] = session[:user_id]
    params.require(:vote).permit(:is_up, :user_id, :votable_id, :votable_type)
  end
end
