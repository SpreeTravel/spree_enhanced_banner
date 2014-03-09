Spree::Taxon.class_eval do
	has_one :taxon_banner_configuration, dependent: :destroy
	has_many :images, as: :viewable, dependent: :destroy

	protected
		def set_default_values_for_banner_configuration
			config = TaxonBannerConfiguration.create()
			config.taxon = self
		end
end