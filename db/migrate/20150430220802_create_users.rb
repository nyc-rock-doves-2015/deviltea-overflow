class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name, null: false, limit: 50, unique: true
      t.string :password_digest, null: false
      t.timestamps
    end
  end
end
