class RemoveIsTaxonomyFromBannerConfigurationTable < ActiveRecord::Migration
  def change
  	remove_column :spree_taxon_banner_configurations, :is_taxonomy, :boolean
  end
end
