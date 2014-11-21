class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :vote, index: true
      t.string :user_name, null: false
      t.text :comment

      t.timestamps
    end
  end
end
