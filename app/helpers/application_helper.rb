module ApplicationHelper
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
  def display_toast_message(message, type)
    if type == :error
      "$().toastmessage('showErrorToast', '#{message}');".html_safe
    else  
      "$().toastmessage('showNoticeToast', '#{message}');".html_safe
    end
  end
end
