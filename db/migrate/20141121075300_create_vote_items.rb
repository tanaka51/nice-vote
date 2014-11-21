class CreateVoteItems < ActiveRecord::Migration
  def change
    create_table :vote_items do |t|
      t.string :name, null: false
      t.text :addition
      t.references :vote, index: true, null: false

      t.timestamps
    end
  end
end
