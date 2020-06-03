class CreateStates < ActiveRecord::Migration[5.2]
  def change
    create_table :states do |t|
      t.integer :rank, default: 0

      t.timestamps
    end
  end
end
