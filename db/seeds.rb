
10.times do
  User.create(name: TubularFaker.name, password: '123')
end

Question.create(title: TubularFaker.company, content: TubularFaker.lingo, user: User.find(User.pluck(:id).sample))

Answer.create(content: TubularFaker.city, user: User.find(User.pluck(:id).sample))

