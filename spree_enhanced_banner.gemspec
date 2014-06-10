# encoding: UTF-8

require 'yaml'
yaml = YAML.load(File.read('SPREE_TRAVEL_VERSIONS'))
versions = yaml['gems']

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_enhanced_banner'
  s.version     = '0.9.0'
  s.summary     = 'Add fancy stuff to the banner'
  s.description = 'Allows banner to be linked with taxons, objects, etc.'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = ['Pedro Quintero', 'Miguel Sancho', 'Cesar Lage', 'Raul Perez-alejo']
  s.email     = 'pqr@openjaf.com'
  s.homepage  = 'http://github.com/openjaf/spree_enhanced_banner'

  s.files       =  Dir['LICENSE', 'README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*'] #`git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= ' + versions['spree']
  s.add_dependency 'spree_auth_devise', '>= ' + versions['spree_auth_devise']


  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'

  s.add_development_dependency 'faker'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'database_cleaner'
end
