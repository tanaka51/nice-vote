class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :title, null: false
      t.text :description
      t.string :password, null: false
      t.boolean :closed, null: false, default: false
      t.string :uuid, null: false

      t.timestamps
    end

    add_index :votes, :uuid, unique: true
  end
end
