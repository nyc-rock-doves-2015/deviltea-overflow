class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :is_up, default: true
      t.references :user, null: false
      t.references :votable, polymorphic: true, index: true
      t.timestamps
    end
    add_index :votes, [:user_id, :votable_id, :votable_type], unique: true
  end
end
