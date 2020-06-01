class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :body
      t.string :a
      t.string :b
      t.string :c
      t.string :d
      t.integer :awnser
      t.integer :rank

      t.timestamps
    end
  end
end
