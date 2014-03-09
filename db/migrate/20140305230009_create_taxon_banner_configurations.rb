class CreateTaxonBannerConfigurations < ActiveRecord::Migration
  def change
    create_table :taxon_banner_configurations do |t|
      t.string :selection_mode
      t.integer :max_count
      t.boolean :is_taxonomy

      t.timestamps
    end
  end
end
