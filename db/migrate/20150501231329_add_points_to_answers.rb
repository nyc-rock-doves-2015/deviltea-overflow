class AddPointsToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :points, :integer, numeric: true, default: 0
  end
end
