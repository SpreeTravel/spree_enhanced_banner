class AddTaxonIdToTaxonBannerConfigurations < ActiveRecord::Migration
  def change
  	add_column :taxon_banner_configurations, :taxon_id, :integer
  end
end
