Spree::Admin::TaxonsController.class_eval do
    def index
      @taxons = Spree::Taxon.all

      respond_to do |format|
      	format.html
      end
    end
  end