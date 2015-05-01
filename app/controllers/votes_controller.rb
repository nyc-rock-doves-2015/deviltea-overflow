class VotesController < ApplicationController
  def create
    # is_up will be determined by the html class of the button that was clicked on, so
      # it needs to be passed by the ajax call.
    # votable_id will be the id of the question or answer I'm voting on.
    # votable_type will be "Question" or "Answer"

    # Vote.create(is_up: , user_id: session[:user_id], votable_id: , votable_type: )
  end
end
