module NavHelper

  #change the hash below to include the actual items you need in your navs. Use the :placement option to specify which nav an item goes in if there are multiple navs.
  def configure_nav_items
    [
<%- names.each do |name| -%>
      #nav items for :<%= name %>
<%- unless name.to_s == 'footer' %>
      {:id => :home,        :label => 'Home',       :url => root_path,                  :placement => :<%= name %>,  :title => 'Home Page'},
      {:id => :example,     :label => 'Example',    :url => placeholder_path(:example), :placement => :<%= name %>, :title => 'Placeholder Example Page'},
<%- end -%>
      {:id => :help,        :label => 'Help',       :url => help_path,                  :placement => :<%= name %>},
<%- end -%>
    ]
  end

  def layout_nav_items(placement=nil)
    init_layout_nav_items
    if placement.nil?
      @layout_nav_items
    else
      layout_nav_items_by_placement(placement)
    end
  end

  def init_layout_nav_items
    unless @layout_nav_items
      @layout_nav_items = configure_nav_items
      @layout_nav_items.each do |nav_item|
        nav_item[:label] ||= nav_item[:id].to_s.titleize
      end
    end
  end

  def layout_nav_items_by_placement(placement)
    @layout_nav_items_by_placement ||= {}
    unless @layout_nav_items_by_placement[placement]
      @layout_nav_items_by_placement[placement] = []
      @layout_nav_items.each do |nav_item| 
        @layout_nav_items_by_placement[placement] << nav_item if nav_item[:placement] == placement
      end
    end
    @layout_nav_items_by_placement[placement]
  end

  attr_accessor :layout_nav

  def layout_nav=(value)
    @layout_nav = value
    @selected_nav_title = (selected_nav_item ? selected_nav_item[:title] : nil)
  end

  def layout_nav_ids
    @layout_nav_ids ||= layout_nav_items.collect{|nav_item|nav_item[:id]}
  end

  def selected_nav_item
    @selected_nav_item ||= layout_nav_item(layout_nav)
  end

  def layout_nav_item(nav_id)
    nav_id = nav_id.intern if nav_id.respond_to? :intern
    layout_nav_items.each do |nav_item|
      return nav_item if nav_item[:id] == nav_id
    end
    nil
  end

  def link_to_nav_item(nav_item)
    items = layout_nav_items(nav_item[:placement])
    css_id = "#{nav_item[:placement]}_#{nav_item[:id]}"
    css_class = (items.index(nav_item) == items.size-1) ? :last : nil
    link_to(nav_item[:label], nav_item[:url], :id => css_id, :class => css_class )
  end

end    
