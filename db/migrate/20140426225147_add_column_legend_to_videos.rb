class AddColumnLegendToVideos < ActiveRecord::Migration
  def up
    add_column :videos, :legend, :string
  end

  def down
    remove_column :videos, :legend
  end
end
