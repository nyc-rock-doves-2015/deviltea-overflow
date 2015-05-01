class AddPointsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :points, :integer, numeric: true, default: 0
  end
end
