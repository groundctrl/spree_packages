lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "spree_packages/version"

Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY
  spec.name        = "spree_packages"
  spec.version     = SpreePackages::VERSION
  spec.authors     = ["David Freerksen"]
  spec.homepage    = "https://github.com/groundctrl/spree_packages"
  spec.summary     = "It does amazing stuff."
  spec.description = spec.summary
  spec.license     = "MIT"

  spec.required_ruby_version = ">= 2.0.0"

  spec.files = Dir["{app,config,db,lib}/**/*",
                   "MIT-LICENSE",
                   "Rakefile",
                   "README.md"]

  spec.test_files   = `git ls-files -- spec/*`.split("\n")
  spec.require_path = "lib"

  spec.requirements << "none"

  spec.add_dependency "spree_core", "~> 2.4"

  spec.add_development_dependency "capybara", "~> 2.4"
  spec.add_development_dependency "coffee-rails"
  spec.add_development_dependency "database_cleaner", "1.4"
  spec.add_development_dependency "factory_girl", "~> 4.5"
  spec.add_development_dependency "poltergeist", "1.6"
  spec.add_development_dependency "pry-byebug", "~> 3.2"
  spec.add_development_dependency "rspec-rails", "~> 3.3"
  spec.add_development_dependency "sass-rails"
  spec.add_development_dependency "simplecov", "~> 0.11"
  spec.add_development_dependency "sqlite3"
end
