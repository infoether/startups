require 'startups'

class StartupLayoutGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      m.directory 'public/stylesheets'
      m.directory 'app/helpers'
      m.directory 'app/views/layouts'
      
      m.file "app/helpers/layout_helper.rb", "app/helpers/layout_helper.rb"

      #TODO add checks here for other startups so the layout can include eg. the nav stuff, etc.
      #TODO possibly add shway versions of things as well.
      m.template "app/views/layouts/startup_layout.html.erb", "app/views/layouts/application.html.erb"#, :assigns => { :foo => 'foo' }
      m.file "app/views/layouts/_startup_layout_footer.html.erb", "app/views/layouts/_footer.html.erb"
      m.file "app/views/layouts/_startup_layout_header.html.erb", "app/views/layouts/_header.html.erb"

      m.file "public/stylesheets/startup_layout_reset.css",  "public/stylesheets/reset.css"
      m.file "public/stylesheets/startup_layout.css",  "public/stylesheets/application.css"

      m.rm 'public/index.html'
    end
  end
  
  protected

    def banner
      <<-EOS
Creates a basic layout with the necessary helpers, stylesheet etc.

USAGE: #{$0} #{spec.name}
EOS
    end

end
