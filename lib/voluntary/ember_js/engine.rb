module Voluntary::EmberJs
  class Engine < ::Rails::Engine
     initializer 'configure ember-rails', before: 'ember_rails.setup_vendor' do
      config.ember.variant = Rails.env

      if defined?(HandlebarsAssets)
        HandlebarsAssets::Config.ember = true
      end
      
      config.handlebars.templates_root = ['templates', 'voluntary/ember_js/templates']
    end
  end
end
