$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "acts_as_our_cities/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "acts_as_our_cities"
  s.version     = ActsAsOurCities::VERSION
  s.authors     = ["Nícolas Iensen"]
  s.email       = ["nicolas@nossascidades.org"]
  s.homepage    = "https://github.com/meurio/acts_as_our_cities"
  s.summary     = "ActsAsOurCities is a wrapper for Our Cities models"
  s.description = "DRYing Our Cities projects by wrapping common behaviours"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_runtime_dependency 'rails', '~> 4.1', '>= 4.1.5'
  s.add_runtime_dependency 'activeresource', '~> 4.0', '>= 4.0.0'

  s.add_development_dependency 'sqlite3', '~> 1.3', '>= 1.3.9'
  s.add_development_dependency 'rspec-rails', '~> 3.1', '>= 3.1.0'
  s.add_development_dependency 'coveralls', '~> 0.7', '>= 0.7.1'
end
