class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content, null: false
      t.references :user, null: false
      t.references :commentable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
