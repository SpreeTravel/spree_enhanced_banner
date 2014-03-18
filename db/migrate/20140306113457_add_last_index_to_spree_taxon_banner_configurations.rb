class AddLastIndexToSpreeTaxonBannerConfigurations < ActiveRecord::Migration
  def change
    add_column :spree_taxon_banner_configurations, :last_index, :integer
  end
end
