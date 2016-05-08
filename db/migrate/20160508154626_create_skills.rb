class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
