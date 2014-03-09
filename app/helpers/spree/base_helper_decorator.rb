Spree::BaseHelper.module_eval do

	def set_banner?(taxon)
		not taxon.nil? and taxon.images.count > 0
	end

	def get_banner_for_taxon(taxon)
		SelectionModeHelper.get_banner_for_taxon(taxon)
	end

	class SelectionModeHelper

		def self.get_banner_for_taxon(taxon)
			taxon_selection_mode = taxon.taxon_banner_configuration.selection_mode

			case(taxon_selection_mode)
				when "random" then self.get_banner_on_random_mode(taxon)
				when "cycle" then self.get_banner_on_cycle_mode(taxon)
			end
				
		end

		private
			def self.get_banner_on_random_mode(taxon)
				images = taxon.images
				random_index = SecureRandom.random_number(images.count)
				taxon.taxon_banner_configuration.update(last_index: random_index)
				images[random_index].attachment.url(:banner)
			end

			def self.get_banner_on_cycle_mode(taxon)
				images = taxon.images
				if (images.count - 1) == taxon.last_index
					taxon.taxon_banner_configuration.update(last_index: 0)
					next_index = taxon.taxon_banner_configuration.last_index
				else
					taxon.taxon_banner_configuration.update(last_index: taxon.taxon_banner_configuration + 1)
					next_index = taxon.taxon_banner_configuration.last_index
				end
				images[next_index].attachment.url(:banner)
			end
	end
end