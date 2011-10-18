extension_path = File.expand_path(File.join(File.dirname(__FILE__), ".."))
require 'compass'
require File.join(extension_path, 'lib', 'theme_images.rb')
Compass::Frameworks.register('sencha-touch', :path => extension_path)
