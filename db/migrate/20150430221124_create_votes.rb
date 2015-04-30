class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :is_up, default: true
      t.references :user, null: false
      t.timestamps
    end
  end
end
