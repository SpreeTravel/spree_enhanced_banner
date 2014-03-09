Spree::Admin::TaxonsController.class_eval do

  def index
    @taxons = Spree::Taxon.all

    respond_to do |format|
    	format.html
    end
  end

  def edit_config
		@taxon = Spree::Taxon.find(params[:id])
		@configuration = Spree::TaxonBannerConfiguration.new

		respond_to do |format|
			format.html
		end
	end

	def set
		@taxon = Spree::Taxon.find(params[:id])			
		
		respond_to do |format|
			if @taxon.taxon_banner_configuration.nil?
				@config = Spree::TaxonBannerConfiguration.new(config_params)
				if @config.save
					@taxon.taxon_banner_configuration = @config
					if params[:reset_indexes]
						@config.update_attribute(:last_index, 0)
					end

					format.html { redirect_to admin_taxons_url, notice: 'Configuration was successfully seted.' }
				else
					Spree::TaxonBannerConfiguration.new
					format.html { render action: "edit_config", notice: 'There has been errors.' }
				end
			else
				@config = Spree::TaxonBannerConfiguration.where(taxon_id: @taxon.id).first
				if @config.update_attributes(config_params)
					if params[:reset_indexes]
						@config.update_attribute(:last_index, 0)
					end
					format.html { redirect_to admin_taxons_url, notice: 'Configuration was successfully seted.' }
				else
					Spree::TaxonBannerConfiguration.new
					format.html { render action: "config", notice: 'There has been errors.' }
				end
			end
		end
	end

	private
		def config_params
			params.require(:taxon_banner_configuration).permit(:selection_mode, :max_count)
		end
end