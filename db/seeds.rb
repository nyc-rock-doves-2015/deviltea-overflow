
10.times do
  User.create(name: TubularFaker.name, password: '123')
end

10.times do
  question = Question.create(title: TubularFaker.company, content: TubularFaker.lingo, user: User.find(User.pluck(:id).sample))

  3.times do
    Answer.create(content: TubularFaker.city, user: User.find(User.pluck(:id).sample), question: question)
  end
end


