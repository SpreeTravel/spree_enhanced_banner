module Spree
  module Admin
		class EnhancedBannerSettingsController < Spree::Admin::BaseController
			
			def edit
				@configuration = Spree::TaxonBannerConfiguration.new

				respond_to do |format|
					format.html
				end
			end

			def save
				respond_to do |format|
					begin
						Spree::TaxonBannerConfiguration.transaction do
							Spree::Taxon.all.each do |taxon|
								if taxon.taxon_banner_configuration.nil?
									config = Spree::TaxonBannerConfiguration.new(config_params)
									config.save
									taxon.taxon_banner_configuration = config
								else
									config = Spree::TaxonBannerConfiguration.where(taxon_id: taxon.id).first
									config.update_attributes(config_params)
								end
								if params[:reset_indexes]
									config = Spree::TaxonBannerConfiguration.where(taxon_id: taxon.id).first
									config.update_attribute(:last_index, 0)
								end
							end

							format.html { redirect_to edit_admin_general_settings_url, notice: 'Configuration was successfully saved.' }
						end
					rescue
						@configuration = Spree::TaxonBannerConfiguration.new
						format.html { render action: "edit" }
					end
				end
			end

			private
				def config_params
					params.require(:taxon_banner_configuration).permit(:selection_mode, :max_count)
				end
		end
	end
end
