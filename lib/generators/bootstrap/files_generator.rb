module Bootstrap
  module Generators
    class FilesGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates files needed for working with bootstrap-rails. It includes partials, views and controllers"
      
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

        source_folder = File.join(File.dirname(File.absolute_path(__FILE__)), "..", "..", "..", "app", "helpers")
        dest_folder = File.join("app", "helpers")
        Dir.entries(source_folder).each do |file|          
          copy_file("#{source_folder}/#{file}", "#{dest_folder}/#{file}") unless File.directory? "#{source_folder}/#{file}"
        end

        source_folder = File.join(File.dirname(File.absolute_path(__FILE__)), "..", "..", "..", "lib", "assets")
        dest_folder = File.join("lib", "assets")
        Dir.entries(source_folder).each do |file|          
          copy_file("#{source_folder}/#{file}", "#{dest_folder}/#{file}") unless File.directory? "#{source_folder}/#{file}"
        end

        source_folder = File.join(File.dirname(File.absolute_path(__FILE__)), "..", "..", "..", "app", "controllers")
        dest_folder = File.join("app", "controllers")
        Dir.entries(source_folder).each do |file|          
          copy_file("#{source_folder}/#{file}", "#{dest_folder}/#{file}") unless File.directory? "#{source_folder}/#{file}"
        end
      end
    end
  end
end