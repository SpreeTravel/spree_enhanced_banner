require 'spec_helper'

describe Spree::TaxonBannerConfiguration do
	context "TaxonBannerConfiguration Fields" do
		it "respond to SelectionMode" do
			should respond_to(:selection_mode)
		end
		it "respond to Max Count" do
			should respond_to(:max_count)
		end
		it "respond to Last Index" do
			should respond_to(:last_index)
		end
	end
	context "TaxonBannerConfiguration Validations" do
		
		context "Selection Mode" do
			subject(:configuration) { Spree::TaxonBannerConfiguration.create(max_count: 5) }

			context "On create" do
				it "can not be nil" do
					configuration.selection_mode.should_not be_nil
				end
				it "can not be empty" do
					configuration.selection_mode.should_not be == ""
				end
				it "is random after create with no arguments" do
					configuration.selection_mode.should be == "random"
				end
				it "is cyclic after create with cyclic argument" do
					subject(:configuration) { Spree::TaxonBannerConfiguration.create(selection_mode: "cyclic", max_count: 5) }
					configuration.selection_mode.should be == "cyclic"
				end
			end
			context "On new" do
				subject(:configuration) { Spree::TaxonBannerConfiguration.new(max_count: 5) }
				it "is not valid without selection mode" do 
					configuration.should_not be_valid
				end
			end
		end

		context "Max Count" do
			subject(:configuration) { Spree::TaxonBannerConfiguration.create(selection_mode: "random") }

			context "On create" do
				it "can not be 0" do
					configuration.max_count.should be > 0
				end
				it "is exactly 50" do
					configuration.max_count.should be == 50
				end
				it "is an integer" do
					configuration.max_count.should be_an_instance_of(Fixnum)
				end
			end
			context "On new" do
				subject(:configuration) { Spree::TaxonBannerConfiguration.new(selection_mode: "random") }
				it "is not valid without max count" do 
					configuration.should_not be_valid
				end
			end
		end

		context "Last Index" do
			its(:last_index) { should be == 0 }
		end
	end
end
