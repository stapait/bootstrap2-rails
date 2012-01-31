require Rails.root + 'lib/assets/menu_creator.rb'
include MenuCreator

class ApplicationController < ActionController::Base
  protect_from_forgery

  # Menu definition  
  #menu_options [{:title => 'Index', :itens => [
  #  {:text => 'Users', :controller => 'users', :action => 'index'}
  #]}];

end
