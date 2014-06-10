class Spree::TaxonBannerConfiguration < ActiveRecord::Base
	belongs_to :taxon, :class_name => 'Spree::Taxon'

	validates :selection_mode, :presence => true
	validates :max_count, :presence => true, :numericality => { :only_integer => true,
  	                                   :greater_than_or_equal_to => 1 }

	before_validation :set_default_values_configuration

	protected

		def set_default_values_configuration
			if self.selection_mode.nil?
				self.selection_mode = "random"
			end
			self.max_count ||= 50
		end
end
