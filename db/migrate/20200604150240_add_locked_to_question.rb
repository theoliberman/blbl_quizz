class AddLockedToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, "locked", :boolean, default: false
  end
end
