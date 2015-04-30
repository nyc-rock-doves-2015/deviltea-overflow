class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false, limit: 256
      t.text :content, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end
