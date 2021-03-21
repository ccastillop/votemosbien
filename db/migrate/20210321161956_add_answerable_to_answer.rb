class AddAnswerableToAnswer < ActiveRecord::Migration[6.1]
  def change
    add_reference :answers, :answerer, polymorphic: true, null: true, index: {unique: true}
  end
end
