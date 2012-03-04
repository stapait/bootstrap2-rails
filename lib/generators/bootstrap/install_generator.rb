module Bootstrap
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Update files needed for bootstrap2-rails"      
      def install
        # Insert lines in application.js  
        inject_into_file "app/assets/javascripts/application.js", 
          "//= require bootstrap\n//= require jquery.toastmessage\n", :before => "//= require_tree"

        # Insert lines in application.css
        inject_into_file "app/assets/stylesheets/application.css", 
          " *= require bootstrap\n *= require jquery.toastmessage\n", :before => "*= require_self"

        # Insert lines in application.html.erb
        inject_into_file "app/views/layouts/application.html.erb", 
          "<%= menu_bar %>\n\n<div class='container-fluid' style='padding-top: 45px'>\n  <% flash.each do |name, msg| %>\n    <%= display_toast_message(msg, name) %>\n  <% end %>\n  ", :before => "<%= yield %>"
        
        inject_into_file "app/views/layouts/application.html.erb", "\n</div>", :after => "<%= yield %>"
      end
    end
  end
end