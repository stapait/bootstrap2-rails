module BootstrapHelper
  # returns a link to sort table columns
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = params[:direction] == "asc" ? "desc" : "asc"
    link_to title, sort: column, direction: direction
  end
  
  def sort_class(direction, column, table_column)
    return nil if column != table_column    
    return 'yellow headerSortDown' if direction == 'asc'
    return 'yellow headerSortUp' if direction == 'desc'
  end
  
  # display a message using the JQuery Toast Message plugin
  # types available: notice, success, warning an error
  def display_toast_message(message, type)
    return nil unless ['notice', 'success', 'warning', 'error'].include? type.to_s.downcase
    result = "<script>"
    result << "$().toastmessage('show#{type.to_s.capitalize}Toast', '#{message}');"
    result << "</script>"
    result.html_safe
  end

  # # Draw menu content
  # def menu_bar
  #   render partial: '/shared/menu', locals: {menu: @@menu}
  # end

  # # Set menu to draw
  # def self.set_menu(menu)
  #   @@menu = menu
  # end
end
