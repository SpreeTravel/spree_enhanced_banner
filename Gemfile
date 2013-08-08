MODE = 'git'  #REMOTE MODE
#MODE = 'path' #LOCAL MODE

# REMOTE CONFIGURATION (DEFAULT)
GEMS_PATH = 'http://rubygems.org'
SPREE_PATH = 'https://github.com/spree'
SPREE_BANNER_PATH = 'https://github.com/damianogiacomello'

## lOCAL PQR CONFIGURATION
#GEMS_PATH = 'http://localhost/rubygems/'
#SPREE_PATH = 'file:///home/pqr/work/jaf/spree'
#SPREE_BANNER_PATH = GEMS_PATH

########################################################################

source GEMS_PATH

gem 'spree_banner', 		:"#{MODE}" => "#{SPREE_BANNER_PATH}/spree_banner"
gem 'spree_auth_devise', 	:"#{MODE}" => "#{SPREE_PATH}/spree_auth_devise", 		:branch => '2-0-stable'

gemspec
