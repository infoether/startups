require 'rubygems'
require 'rake'
require 'echoe'

Echoe.new('startups', '0.0.2.1') do |p|
  p.project        = "startups"
  p.description    = "A collection of Rails \"startups\" for features such as a standard layout, navigation and forms with customizable error handling."
  p.url            = "http://rubyforge.org/projects/startups"
  p.author         = 'Ryan Owens'
  p.email          = "ryan (at) infoether (dot) com"
  p.ignore_pattern = ["tmp/*", "script/*", "startups_notes.txt", "*.tmproj"]
  p.development_dependencies = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }

