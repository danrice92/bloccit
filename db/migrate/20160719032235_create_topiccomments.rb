class CreateTopiccomments < ActiveRecord::Migration
  def change
    create_table :topiccomments do |t|
      t.text :body
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
