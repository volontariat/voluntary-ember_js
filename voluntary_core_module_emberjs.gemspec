$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "voluntary_core_module_emberjs/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "voluntary_core_module_emberjs"
  s.version     = VoluntaryCoreModuleEmberjs::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of VoluntaryCoreModuleEmberjs."
  s.description = "TODO: Description of VoluntaryCoreModuleEmberjs."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency 'voluntary', '0.1.0.rc2' 
  
  #s.add_dependency 'ember-rails'
  #s.add_dependency 'ember-source', '1.0.0.rc6.4'
  s.add_dependency 'ember-rails'
  s.add_dependency 'ember-source', '~> 1.4.0.beta.3'
  
  s.add_dependency 'active_model_serializers'#, github: 'rails-api/active_model_serializers'
  
  # :development, :test
  s.add_development_dependency 'rspec-rails', '~> 2.0'
  s.add_development_dependency 'jasminerice'
  s.add_development_dependency 'guard-jasmine'
  
  # :test, :cucumber
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'selenium-webdriver',       '2.27.2'
  s.add_development_dependency 'spork',                    '~> 1.0rc'
  s.add_development_dependency 'timecop'
  s.add_development_dependency 'simplecov'#, require: false
  
  # :development, :test, :cucumber
  s.add_development_dependency 'factory_girl_rails'
  
  # :cucumber
  s.add_development_dependency 'capybara',         '1.1.2'
  s.add_development_dependency 'capybara-webkit',  '0.13.0'
  s.add_development_dependency 'cucumber-rails',   '1.3.0'#, require: false
  s.add_development_dependency 'launchy',          '2.0.5'
end
