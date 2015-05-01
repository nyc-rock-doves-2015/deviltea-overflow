require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  describe "true" do
    it "is true" do
      # get :index
      puts 'in the test'
      expect(true).to be(true)
    end
  end
end