class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :answer
      t.references :player, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
