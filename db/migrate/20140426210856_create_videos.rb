class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.integer :methodology_id
      t.string :url

      t.timestamps
    end
  end
end
