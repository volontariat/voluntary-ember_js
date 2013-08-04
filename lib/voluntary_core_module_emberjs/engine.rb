module VoluntaryCoreModuleEmberjs
  class Engine < ::Rails::Engine
     config.ember.variant = Rails.env
  end
end
