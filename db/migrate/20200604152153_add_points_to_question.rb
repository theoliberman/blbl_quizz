class AddPointsToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, "points", :integer, default: 1
  end
end
