$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fresh_change_log/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fresh_change_log"
  s.version     = FreshChangeLog::VERSION
  s.authors     = ["Jannes Koehler"]
  s.email       = ["janneskoehler@gmail.com"]
  s.homepage    = ""
  s.summary     = "Provides a Change Log for Rails Applications."
  s.description = "Provides a Change Log for Rails Applications."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.3"

  s.add_development_dependency "sqlite3"
end
