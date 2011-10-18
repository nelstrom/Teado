Gem::Specification.new do |s|
  # Release Specific Information
  s.version = "1.1.0"
  s.date = "2011-10-12"

  # Gem Details
  s.name = "sencha-touch"
  s.authors = ["Sencha"]
  s.summary = %q{Sencha Touch theme packaged as a gem}
  s.description = %q{Sencha Touch theme packaged as a gem}
  s.email = "andrew.jr.neil@gmail.com"
  s.homepage = "http://sencha.com/"

  # Gem Files
  s.files = %w(README.md)
  s.files += Dir.glob("lib/**/*.*")
  s.files += Dir.glob("stylesheets/**/*.*")
  s.files += Dir.glob("templates/**/*.*")
  s.files += Dir.glob("images/**/*.*")

  # Gem Bookkeeping
  s.rubygems_version = %q{1.3.6}
  s.add_dependency("compass", [">= 0.12.alpha"])
end
