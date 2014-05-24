class AddIndexOnAll < ActiveRecord::Migration
  def change
    add_index :methodologies, :user_id
    add_index :comments, :methodology_id
    add_index :friendships, :user_id
    add_index :friendships, :friend_id
    add_index :comments, :user_id
    add_index :videos, :methodology_id
    add_index :schools, :user_id
    add_index :feeds, :user_id
    add_index :images, :methodology_id
  end
end
