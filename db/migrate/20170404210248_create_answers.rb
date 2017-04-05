class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :reply
      t.references :test, foreign_key: true
      t.references :application, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
