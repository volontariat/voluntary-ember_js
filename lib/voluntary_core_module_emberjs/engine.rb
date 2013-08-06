module VoluntaryCoreModuleEmberjs
  class Engine < ::Rails::Engine
     initializer 'configure ember-rails', before: 'ember_rails.setup_vendor' do
      config.ember.variant = Rails.env

      #config.handlebars.templates_root = 'voluntary_core_module_emberjs/templates'
    end
  end
end
