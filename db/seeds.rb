
def random_user
  User.find(User.pluck(:id).sample)
end

def random_nonvoter
  all_users = User.pluck(:id)
  voters = Vote.pluck(:user_id)
  nonvoter_id = (all_users - voters).sample
  User.find(nonvoter_id)
end

100.times do
  User.create(name: TubularFaker.name, password: '123')
end

10.times do
  question = Question.create(title: TubularFaker.company, content: Faker::Lorem.paragraph(2), user: random_user)

  rand(5).times do
    Vote.new(is_up: true, user: random_nonvoter, votable_id: question.id, votable_type: "Question").save
  end

  2.times do
    question.comments << Comment.create(content: TubularFaker.company, user: random_user)
  end

  rand(5).times do
    answer = Answer.create(content: Faker::Lorem.paragraph(2), user: random_user, question_id: question.id)

    2.times do
      answer.comments << Comment.create(content: TubularFaker.company, user: random_user)
    end

    rand(5).times do
      Vote.new(is_up: true, user: random_nonvoter, votable_id: answer.id, votable_type: "Answer").save
    end
  end
end

# create demo user last so she hasn't voted
User.create(name: 'olivia', password: '123')
