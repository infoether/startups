require 'startups'

class StartupNavGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      m.directory 'app/views/layouts'
      m.directory 'public/stylesheets'
      m.directory 'app/helpers'
      
      #add top and footer by default
      unless @args.include? "top"
        @args << "top"
        @args << "footer"
      end

      m.template "nav.css",  "public/stylesheets/nav.css", :assigns => { :names => @args }
      m.template "nav_helper.rb", "app/helpers/nav_helper.rb", :assigns => { :names => @args }
      @args.each do |name|
        m.template "_nav.html.erb", "app/views/layouts/_#{name}_nav.html.erb", :assigns => { :name => name }
      end
    end
  end
  
  protected

    def banner
      <<-EOS
Creates generic navigation with a customizable helper and stylesheet.

USAGE: #{$0} #{spec.name}
EOS
    end

end
