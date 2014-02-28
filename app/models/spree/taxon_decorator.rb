Spree::Taxon.class_eval do
	has_many :images, as: :viewable, dependent: :destroy
end