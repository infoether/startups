require 'startups'

class StartupLayoutGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      m.directory 'public/stylesheets'
      m.directory 'public/javascripts'
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
      m.file "public/stylesheets/startup_white.css", "public/stylesheets/white.css"
      m.file "public/stylesheets/startup_layout_master.css", "public/stylesheets/master.css"
      m.file "public/stylesheets/startup_layout_ie6.css", "public/stylesheets/global-ie6.css"
      m.file "public/stylesheets/startup_layout_ie7.css", "public/stylesheets/global-ie7.css"
      m.file "public/stylesheets/startup_layout_iepngfix.htc", "public/stylesheets/iepngfix.htc"

      m.file "public/javascripts/startup_application.js", "public/javascripts/application.js"
      m.file "public/javascripts/startup_imgSizer.js", "public/javascripts/imgSizer.js"
      m.file "public/javascripts/startup_iepngfix.js", "public/javascripts/iepngfix_tilebg.js"
      
      m.file "public/images/blank.gif", "public/images/blank.gif"

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
