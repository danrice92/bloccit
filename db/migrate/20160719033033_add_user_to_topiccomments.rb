class AddUserToTopiccomments < ActiveRecord::Migration
  def change
    add_reference :topiccomments, :user, index: true, foreign_key: true
  end
end
