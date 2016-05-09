class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :self_intro, :text
    add_column :users, :motto, :string
    add_column :users, :avatar, :string
  end
end
