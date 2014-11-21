class CreateAnswerItems < ActiveRecord::Migration
  def change
    create_table :answer_items do |t|
      t.references :answer, index: true, null: false
      t.references :vote_item, index: true, null: false
      t.integer :rank

      t.timestamps
    end
  end
end
