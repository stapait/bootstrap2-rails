module MenuCreator
  @@loaded = false
  @@menu_params = []

  def menu_options(params)
    @@menu_params = params unless @@loaded
  end

  def menu_bar
    return nil unless @@menu_params

    html = '<div class="topbar-wrapper" style="z-index:5">'
    html += '<div class="topbar" data-dropdown="dropdown">'
    html += '<div class="topbar-inner">'
    html += '<div class="container">'
    html += '<ul class="nav">'
    
    @@menu_params.each do |param|
      html += '<li class="dropdown">'
      html += link_to(param[:title], '#', class: 'dropdown-toggle')
      html += '<ul class="dropdown-menu">'

      param[:itens].each do |subitem|
        html += content_tag(:li, link_to(subitem[:text], controller: subitem[:controller], action: subitem[:action]))
      end

      html += '</ul>'
      html += '</li>'
    end
    
    html += '</ul>'  
    html += '</div>'
    html += '</div>'
    html += '</div>'
    html += '</div>'

    html.html_safe
  end
end