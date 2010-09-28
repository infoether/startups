class StartupNavGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  argument :args, :type => :array, :default => ['top', 'footer'], :banner => 'nav partials'
  
  def generate_nav
    
    unless args.include? "top"
      args << "top"
      args << "footer"
    end
    
    @names = args
    
    empty_directory 'app/views/layouts'
    empty_directory 'public/stylesheets'
    empty_directory 'app/helpers'
    
    template "nav.css",  "public/stylesheets/nav.css"
    template "nav_helper.rb", "app/helpers/nav_helper.rb"
    while names.length > 0
      @name = names.shift
      template "_nav.html.erb", "app/views/layouts/_#{name}_nav.html.erb"
    end
  end
  
  private
  
  def names
    @names
  end
  
  def name
    @name
  end
  
end
