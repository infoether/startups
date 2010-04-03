require 'startups'

class StartupContentGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      m.directory 'app/helpers'
      m.directory 'app/controllers'
      m.directory 'app/views/content'
      m.directory 'test/functional'
      
      m.file "content_controller.rb", "app/controllers/content_controller.rb"
      m.file "home.html.erb", "app/views/content/home.html.erb"
      m.file "help.html.erb", "app/views/content/help.html.erb"
      m.file "example.html.erb", "app/views/content/example.html.erb"
      m.file "content_helper.rb", "app/helpers/content_helper.rb"
      m.file "content_controller_test.rb", "test/functional/content_controller_test.rb"
      
      m.route %{
      map.with_options(:controller => "content") do |content_map|
        content_map.help        'help',               :action => 'help'
        content_map.placeholder 'placeholder/:name',  :action => 'placeholder'
      end }
      m.route 'map.root :controller => "content", :action => "home"'
      
      # example
      # m.route :name => 'version', :controller => 'version', :action => 'display_version'
    end
  end
  
  protected

    def banner
      <<-EOS
Creates content controller for home and other non-rest pages.

USAGE: #{$0} #{spec.name}
EOS
    end

end
