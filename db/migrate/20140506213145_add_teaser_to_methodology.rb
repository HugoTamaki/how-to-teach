class AddTeaserToMethodology < ActiveRecord::Migration
  def change
    add_column :methodologies, :teaser, :text
  end
end
