Spree::BaseHelper.module_eval do

	def set_banner?(taxon)
		not taxon.nil?
	end

	def get_banner_for_taxon(taxon)
		taxon.images.first.attachment.url(:banner)
	end
end