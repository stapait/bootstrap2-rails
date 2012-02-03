module Bootstrap
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates views needed for working with bootstrap2-rails"
      
      def generate_files
        source_folder = File.join(File.dirname(File.absolute_path(__FILE__)), "..", "..", "..", "app", "views", "shared")
        dest_folder = File.join("app", "views", "shared")
        Dir.entries(source_folder).each do |file|          
          copy_file("#{source_folder}/#{file}", "#{dest_folder}/#{file}") unless File.directory? "#{source_folder}/#{file}"
        end

        source_folder = File.join(File.dirname(File.absolute_path(__FILE__)), "..", "..", "..", "app", "views", "layouts")
        dest_folder = File.join("app", "views", "layouts")
        Dir.entries(source_folder).each do |file|          
          copy_file("#{source_folder}/#{file}", "#{dest_folder}/#{file}") unless File.directory? "#{source_folder}/#{file}"
        end
      end
    end
  end
end