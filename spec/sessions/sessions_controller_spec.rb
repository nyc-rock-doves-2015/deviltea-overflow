require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  describe 'GET #new' do
    it 'renders a login form' do
      get :new
      expect(response).to render_template('new')
    end
  end
end