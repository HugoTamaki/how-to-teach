class AddAcceptedAndInvitedColumns < ActiveRecord::Migration
  def up
    add_column :friendships, :accepted, :boolean
    add_column :friendships, :invited, :boolean 
  end

  def down
    remove_column :friendships, :accepted
    remove_column :friendships, :invited
  end
end
