require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "GET #index" do
    it "assigns all questions to variable questions" do
      get :index
      expect(assigns(:questions)).to eq Question.all
    end
  end

  describe "POST #create" do
    let(:user) { FactoryGirl.create(:user) }
    it "creates a question" do
      session[:user_id] = user.id
      expect {
        post :create, question: FactoryGirl.attributes_for(:question)
      }. to change{Question.count}.by(1)
      expect(response).to redirect_to(questions_path)
    end

    it "does not create an invalid question" do
      session[:user_id] = user.id
      expect {
        post :create, question: FactoryGirl.attributes_for(:question, title: nil)
      }. to change{Question.count}.by(0)
      expect(response).to render_template(:new)
    end
  end

end