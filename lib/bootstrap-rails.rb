require "bootstrap-rails/version"

module BootstrapRails
  class Railtie < Rails::Railtie
    config.app_generators do |g|
      # Make templates loadable from gem insted of copying to app
      g.templates.unshift File::expand_path('../templates', __FILE__)
    end 
  end
end
