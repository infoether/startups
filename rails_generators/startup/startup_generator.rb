require 'startups'

class StartupGenerator < Rails::Generator::Base
  
  def manifest
    record do |m|
      m.generate('startup_content')
      m.generate('startup_layout')
      m.generate('startup_nav')
    end
  end
  
  protected

    def banner
      <<-EOS
Runs all of the startup generators, creating a ready-to-go wireframe layout with navigation and example files.

USAGE: #{$0} #{spec.name}
EOS
    end

end
