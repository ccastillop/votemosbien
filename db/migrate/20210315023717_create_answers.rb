class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :session_id, index: true
      t.belongs_to :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
