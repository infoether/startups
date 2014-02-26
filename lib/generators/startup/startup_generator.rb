class StartupGenerator < Rails::Generators::Base
  
  def generate_all
    generate :startup_content, "-fq"
    generate :startup_layout, "-fq"
    generate :startup_nav, "-fq"
  end
end
