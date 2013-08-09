CONFIG = :snc
###########################################################################
case CONFIG
when :pqr
  GEMS_PATH = 'http://localhost/rubygems/'
  SPREE_DEVISE_PATH = 'file:///home/pqr/work/jaf/spree'
  SPREE_BANNER_PATH = 'file:///home/pqr/work/jaf/spree'
when :snc
  GEMS_PATH = 'file:///home/test/.rvm/gems/ruby-1.9.3-p392/bundler/gems/'
  SPREE_DEVISE_PATH = 'file:///media/Data/jaf/spree'
  SPREE_BANNER_PATH = 'file:///media/Data/jaf/spree'
else
  GEMS_PATH = 'http://rubygems.org'
  SPREE_DEVISE_PATH = 'https://github.com/spree'
  SPREE_BANNER_PATH = 'https://github.com/radar'
end
###########################################################################

source GEMS_PATH

gem 'spree_banner', 		:git => "#{SPREE_BANNER_PATH}/spree_banner"
gem 'spree_auth_devise', 	:git => "#{SPREE_DEVISE_PATH}/spree_auth_devise", 		:branch => '2-0-stable'

gemspec
