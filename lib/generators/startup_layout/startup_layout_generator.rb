class StartupLayoutGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  
  def generate_layout
    empty_directory 'public/stylesheets'
    empty_directory 'public/javascripts'
    empty_directory 'app/helpers'
    empty_directory 'app/views/layouts'
    
    copy_file "app/helpers/layout_helper.rb", "app/helpers/layout_helper.rb"
    copy_file "app/views/layouts/startup_layout.html.erb", "app/views/layouts/application.html.erb"
    copy_file "app/views/layouts/_startup_layout_footer.html.erb", "app/views/layouts/_footer.html.erb"
    copy_file "app/views/layouts/_startup_layout_header.html.erb", "app/views/layouts/_header.html.erb"

    copy_file "public/stylesheets/startup_layout_reset.css",  "public/stylesheets/reset.css"
    copy_file "public/stylesheets/startup_layout.css",  "public/stylesheets/application.css"
    copy_file "public/stylesheets/startup_white.css", "public/stylesheets/white.css"
    copy_file "public/stylesheets/startup_layout_master.css", "public/stylesheets/master.css"
    copy_file "public/stylesheets/startup_layout_ie6.css", "public/stylesheets/global-ie6.css"
    copy_file "public/stylesheets/startup_layout_ie7.css", "public/stylesheets/global-ie7.css"
    copy_file "public/stylesheets/startup_layout_iepngfix.htc", "public/stylesheets/iepngfix.htc"

    copy_file "public/javascripts/startup_application.js", "public/javascripts/application.js"
    copy_file "public/javascripts/startup_imgSizer.js", "public/javascripts/imgSizer.js"
    copy_file "public/javascripts/startup_iepngfix.js", "public/javascripts/iepngfix_tilebg.js"

    copy_file "public/images/blank.gif", "public/images/blank.gif"
    
    remove_file 'public/index.html'
  end
end
