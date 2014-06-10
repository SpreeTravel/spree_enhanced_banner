module Spree
  module Admin
		class EnhancedBannersController < Spree::Admin::BaseController

			after_action :initialize_banner_configuration, only: [:create]

			def index
				@taxon = Spree::Taxon.find(params[:taxon_id])
				@banners = @taxon.images

				respond_to do |format|
					format.html
				end
			end

			def new
				@taxon = Spree::Taxon.find(params[:taxon_id])
				@image = Spree::Image.new

				respond_to do |format|
					format.html
				end
			end

			def create
				@taxon = Spree::Taxon.find(params[:taxon_id])
				@image = @taxon.images.build(image_params)

				respond_to do |format|
					if @image.save
						format.html { redirect_to admin_taxon_enhanced_banners_path(:taxon_id => @taxon.id), notice: 'Banner was successfully added.' }
					else
						@image = Spree::Image.new
						format.html { render action: "new", notice: 'Sorry, banner creation failed.' }
					end
				end
			end

			def destroy
				@image = Spree::Image.find(params[:id])
				@taxon = @image.viewable
				@banners = @taxon.images
				@image.destroy

				respond_to do |format|
		      format.html { render action: "index", notice: 'Banner was successfully removed.' }
		      format.js { render :partial => "spree/admin/shared/destroy", notice: 'Banner was successfully removed.' }
		    end
			end

			private
				def image_params
				  params.require(:image).permit(:attachment)
				end

				def initialize_banner_configuration()
					@taxon.taxon_banner_configuration ||= Spree::TaxonBannerConfiguration.create(:taxon_id => @taxon.id)
				end
		end
	end
end