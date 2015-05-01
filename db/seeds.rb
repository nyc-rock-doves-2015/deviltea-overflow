
User.create(name: 'olivia', password: '123')

10.times do
  User.create(name: TubularFaker.name, password: '123')
end

10.times do
  question = Question.create(title: TubularFaker.company, content: TubularFaker.lingo, user: User.find(User.pluck(:id).sample))

  2.times do
    question.comments << Comment.create(content: TubularFaker.company, user: User.find(User.pluck(:id).sample))
  end

  3.times do
    answer = Answer.create(content: TubularFaker.city, user: User.find(User.pluck(:id).sample), question_id: question.id)

    2.times do
      answer.comments << Comment.create(content: TubularFaker.company, user: User.find(User.pluck(:id).sample))
    end

  end
end
