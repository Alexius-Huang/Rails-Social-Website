class AddUserIdToInterest < ActiveRecord::Migration
  def change
    add_column :interests, :user_id, :integer
  end
end
