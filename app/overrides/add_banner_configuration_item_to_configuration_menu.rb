Deface::Override.new(:virtual_path => "spree/admin/shared/_configuration_menu",
                      :name => "add_enhanced_banner_settings",
                      :insert_bottom => "[data-hook='admin_configurations_sidebar_menu'], #admin_configurations_sidebar_menu[data-hook]",
                      :partial => "spree/admin/enhanced_banner_settings/configuration_menu_items")