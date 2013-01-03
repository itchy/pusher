class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :chat_id
      t.integer :rating, :default => 0
      t.string :title
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
