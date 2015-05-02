require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "GET #index" do
    it "assigns all questions to variable questions" do
      get :index
      expect(assigns(:questions)).to eq Question.all
    end
  end

end