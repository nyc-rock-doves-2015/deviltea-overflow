class AddPointsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :points, :integer, numeric: true, default: 0
  end
end
