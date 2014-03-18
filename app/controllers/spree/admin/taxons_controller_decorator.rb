Spree::Admin::TaxonsController.class_eval do

  def index
    @taxons = Spree::Taxon.all

    respond_to do |format|
    	format.html
    end
  end

  def edit_config
		@taxon = Spree::Taxon.find(params[:id])
		if @taxon.taxon_banner_configuration.nil?
			@configuration = Spree::TaxonBannerConfiguration.new
		else
			@configuration = @taxon.taxon_banner_configuration
		end

		respond_to do |format|
			format.html
		end
	end

	def set
		@taxon = Spree::Taxon.find(params[:id])			
		
		respond_to do |format|
			begin
				retrive_or_create(@taxon)
				if params[:reset_indexes]
					@configuration.update_attribute(:last_index, 0)
				end

				format.html { redirect_to admin_taxons_url, notice: 'Configuration was successfully seted.' }
			rescue
				@configuration = Spree::TaxonBannerConfiguration.new
				format.html { render action: "edit_config", notice: 'Set configuration failed.' }
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