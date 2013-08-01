# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_enhanced_banner'
  s.version     = '2.0.3'
  s.summary     = 'Add fancy stuff to the banner'
  s.description = 'Allows banner to be linked with taxons, objects, etc.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'OpenJAF'
  s.email     = 'pqr@openjaf.com'
  s.homepage  = 'http://github.com/openjaf/spree_travel/spree_enhanced_banner'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.0.3'
  #s.add_dependency 'spree_banner'
  #s.add_dependency 'spree_auth_devise'

  s.add_development_dependency 'capybara', '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
