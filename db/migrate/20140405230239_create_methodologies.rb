class CreateMethodologies < ActiveRecord::Migration
  def up
    create_table :methodologies do |t|
      t.string :title
      t.text :content
      t.integer :user_id

      t.timestamps
    end
  end

  def down
  	drop_table :methodologies
  end
end
