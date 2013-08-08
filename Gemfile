CONFIG = :pqr
###########################################################################
case CONFIG
when :pqr
  GEMS_PATH = 'http://localhost/rubygems/'
  SPREE_PATH = 'file:///home/pqr/work/jaf/spree'
  SPREE_BANNER_PATH = 'file:///home/pqr/work/jaf/spree'
else
  GEMS_PATH = 'http://rubygems.org'
  SPREE_PATH = 'https://github.com/spree'
  SPREE_BANNER_PATH = 'https://github.com/damianogiacomello'
end
###########################################################################

source GEMS_PATH

gem 'spree_banner', 		:git => "#{SPREE_BANNER_PATH}/spree_banner"
gem 'spree_auth_devise', 	:git => "#{SPREE_PATH}/spree_auth_devise", 		:branch => '2-0-stable'

gemspec
