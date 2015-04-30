class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content, null: false
      t.references :user, null: false
      t.references :commentable, polymorphic: true, index: true
      t.references :votable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
