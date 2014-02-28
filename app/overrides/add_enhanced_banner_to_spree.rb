Deface::Override.new(:virtual_path => "spree/shared/_header",
                      :name => "add_enhanced_banner_to_spree",
                      :insert_top => "#header[data-hook]",
                      :partial => "spree/shared/set_enhanced_banner")