require 'rails_helper'

RSpec.describe Comment, type: :controller do

  let(:duck_user1) { double("User", name: "Daffy", password_digest: "123")}
  let(:duck_user2) { double("User", name: "Plucky", password_digest: "123")}
  let(:duck_question) { double("Question", title: "Does it quack?",
                                           content: "I have a duck I need to assess.",
                                           user: :duck_user1)}
  let(:duck_answer) { double("Answer", content: "It quacks.",
                                       user: :duck_user2)}

  it 'creates a new comment that knows if it is a response to a Question or an Answer'

  end

end
