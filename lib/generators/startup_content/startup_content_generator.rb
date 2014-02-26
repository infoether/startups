class StartupContentGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  def generate_content
    
    empty_directory 'app/helpers'
    empty_directory 'app/controllers'
    empty_directory 'app/views/content'
    empty_directory 'test/functional'
    
    copy_file "content_controller.rb", "app/controllers/content_controller.rb"
    copy_file "home.html.erb", "app/views/content/home.html.erb"
    copy_file "help.html.erb", "app/views/content/help.html.erb"
    copy_file "example.html.erb", "app/views/content/example.html.erb"
    copy_file "content_helper.rb", "app/helpers/content_helper.rb"
    copy_file "content_controller_test.rb", "test/functional/content_controller_test.rb"
    
    route('root :to => "content#home"')
    route('match "/placeholder/:name" => "content#placeholder", :as => "placeholder"')
    route('match "/help" => "content#help"')
    
  end
end
