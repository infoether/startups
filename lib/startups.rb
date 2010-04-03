module Startups
  # look under rails_generators for the meat
end

#TODO put this somewhere else, or figure out a better way to do it so I don't have to copy it for other generators.
#modified from: http://patshaughnessy.net/2009/9/2/rails-generator-tutorial-part-2-writing-a-custom-manifest-action
module Rails
  module Generator
    module Commands

      class Base
        def route_code(route_options)
          if route_options.is_a? Hash
            "map.#{route_options[:name]} '#{route_options[:name]}', :controller => '#{route_options[:controller]}', :action => '#{route_options[:action]}'"
          else
            route_options.to_s.gsub("\n    ","\n").strip
          end
        end
        def route_code_log_message(route_options)
          code = route_code(route_options)
          if code.index "\n"
            code = code[0,code.index("\n")]
            code = "#{code} ... end" if code.index ' do '
          end
          code
        end
      end

# Here's a readable version of the long string used above in route_code;
# but it should be kept on one line to avoid inserting extra whitespace
# into routes.rb when the generator is run:
# "map.#{route_options[:name]} '#{route_options[:name]}',
#     :controller => '#{route_options[:controller]}',
#     :action => '#{route_options[:action]}'"

      class Create
        def route(route_options)
          sentinel = 'ActionController::Routing::Routes.draw do |map|'
          logger.route route_code_log_message(route_options)
          #TODO add something here to prevent duplicating the route. Like file_contains? or something.
          gsub_file 'config/routes.rb', /(#{Regexp.escape(sentinel)})/mi do |m|
              "#{m}\n  #{route_code(route_options)}\n"
          end
        end
        
        def generate(name)
          logger.generate "running additional generator: #{name}"
          Rails::Generator::Scripts::Generate.new.run([name])
        end
        
        def rm(relative_destination)
          destination = destination_path('public/index.html')
          if File.exist?(destination)
            logger.rm relative_destination
            FileUtils.rm(destination)
          end
        end
      end

      class Destroy
        def route(route_options)
          logger.remove_route route_code_log_message(route_options)
          # to_remove = "\n  #{route_code(route_options)}"
          to_remove = "\n  #{route_code(route_options)}\n"
          gsub_file 'config/routes.rb', to_remove, ''
        end

        def generate(name)
          logger.destroy "rewinding additional generator: #{name}"
          Rails::Generator::Scripts::Destroy.new.run([name])
        end

        def rm(relative_destination)
          logger.gone "can't replace rm'd file: #{relative_destination}"
        end
      end

    end
  end
end