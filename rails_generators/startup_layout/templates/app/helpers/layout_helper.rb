module LayoutHelper

  attr_accessor :title, :heading, :heading_image, :body_class, :crumbs

  #for any options that match setter methods, set them. Raise errors for the rest.
  def layout_options(options={})
    return if options.blank?
    options = options.clone
    options.keys.each do |key|
      #if there is a layout_ version of the setter, call it
      layout_setter = "layout_#{key}=".intern
      if self.respond_to? layout_setter
        self.send layout_setter, options.delete(key) 
        next
      end
      setter = "#{key}=".intern
      #if there is a setter, call it
      if self.respond_to? setter
        self.send setter, options.delete(key) 
        next
      end
      #if there is a no setter, but there is a method, call it with *args
      #TODO write some tests for varying method signatures
      if self.respond_to?(key) && (method(key).arity == 1 || method(key).arity <= -2)
        self.send key, *options.delete(key) 
        next
      end
      #if there was no setter and no method available, raise
      raise "No setter or method was found for the layout_option: #{key}"
    end
    nil
  end

  def layout_title
    #NOTE: @selected_nav_title may get set by the nav startup if it's installed. Using the instance var makes it easier to mix and match the startups.
    @title || @selected_nav_title || @heading || 'Default Title (CHANGEME)'
  end
  
  def layout_heading(text=@heading,options={})
    options[:img] = @heading_image unless options.has_key? :img
    if options[:img].blank?
      text.blank? ? nil : %{<h1>#{text}</h1>}
      #TODO make sifrd an option
      # text.blank? ? nil : %{<h1 class="sifrd">#{text}</h1>}
    else
      %{<h1>#{image_tag(options[:img], :alt => text)}</h1>} unless text.blank?
    end
  end

  def layout_crumbs
    return if @crumbs.blank?
    html = []
    html << '<div class="crumbs">'
    @crumbs.each do |crumb| 
      html << crumb
      html << '<span>&raquo;</span>'
    end
    html << '</div>'
    html.join
  end
  
  def layout_body_tag
    class_att = body_class ? %{ class="#{body_class}"} : nil
    if @layout_nav
      %{<body id="#{@layout_nav}"#{class_att}>}
    else
      '<body>'
    end
  end

end
