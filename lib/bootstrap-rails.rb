require "bootstrap-rails/version"
require "will_paginate"
require "bootstrap-rails/bootstrap_helper"
require "bootstrap-rails/menu_creator"

module BootstrapRails
  module Rails
    class Engine < ::Rails::Engine
      # Include helper inside app
      ActionView::Base.send :include, BootstrapHelper
      ActionView::Base.send :include, MenuCreator

      config.app_generators do |g|
        # Make templates loadable from gem insted of copying to app
        g.templates.unshift File::expand_path('../templates', __FILE__)
      end
    end
  end
end
