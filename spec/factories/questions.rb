#factories are named after the singular, so the file should be question.rb as
#well.
#
#Also, when you want to create an instance as an associated entity, FactoryGirl
#will do that for you.
#
#https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md

FactoryGirl.define do
  factory :question do
    title "Title"
    content "This is content"
    user
  end
end
