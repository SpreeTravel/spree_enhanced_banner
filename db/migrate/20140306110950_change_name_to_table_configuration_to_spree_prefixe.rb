class ChangeNameToTableConfigurationToSpreePrefixe < ActiveRecord::Migration
  def change
  	rename_table :taxon_banner_configurations, :spree_taxon_banner_configurations
  end
end
