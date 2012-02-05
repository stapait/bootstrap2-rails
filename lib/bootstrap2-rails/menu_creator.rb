module MenuCreator
  class MenuBar
    attr_accessor :project_name, :dropdowns
  
    def initialize
      @dropdowns = []
    end

    def add_dropdown(dropdown)
      @dropdowns << dropdown if valid_dropdown?(dropdown)
    end

    # Check if is a valid dropdown
    # A valid dropdown is a class with position an caption attributes and
    # an array of subitems
    def valid_dropdown?(dropdown)
      return false unless dropdown.position
      return false unless %W(left right).include? dropdown.position.to_s
      return false unless dropdown.caption      
      return false unless valid_subitems?(dropdown.subitems)
      true
    end

    # Check if all subitems are valid
    # Subitem must be a hash with keys :caption, :controller and :action or
    # a string "---" in case of a separator
    def valid_subitems?(subitems)
      return false if subitems.length == 0
      subitems.each do |subitem|
        if subitem.class.to_s == "Hash"
          return false unless subitem.has_key?(:caption) && subitem.has_key?(:controller) &&
            subitem.has_key?(:action)
        else
          return false unless subitem.to_s == '---'
        end
      end
      true
    end    
  end

  # Dropdown menu class
  class MenuDropdown
    attr_accessor :position, :caption, :subitems

    def initialize
      @subitems = []
    end
  end

  # Draw menu content
  def menu_bar
    render partial: '/shared/menu', locals: {menu: @@menu}
  end

  # Set menu to draw
  def self.set_menu(menu)
    @@menu = menu
  end
end