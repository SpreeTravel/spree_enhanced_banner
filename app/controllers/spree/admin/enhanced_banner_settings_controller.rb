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
								retrive_or_create(taxon)
								if params[:reset_indexes]
									@configuration.update_attribute(:last_index, 0)
								end
							end

							format.html { redirect_to edit_admin_general_settings_url, notice: 'Configuration was successfully saved.' }
						end
					rescue
						format.html { render action: "edit", notice: 'Set configuration failed.' }
					end
				end
			end

			private
				def config_params
					params.require(:taxon_banner_configuration).permit(:selection_mode, :max_count)
				end

				def retrive_or_create(taxon)
					if taxon.taxon_banner_configuration.nil?
						@configuration =  Spree::TaxonBannerConfiguration.new(config_params)
						@configuration.save
						taxon.taxon_banner_configuration = @configuration
					else
						@configuration =  Spree::TaxonBannerConfiguration.where(taxon_id: taxon.id).first
						@configuration.update_attributes(config_params)
					end
				end
		end
	end
end
