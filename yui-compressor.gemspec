Gem::Specification.new do |s|
  s.name = "yui-compressor"
  s.version = "0.9.0"
  s.date = "2009-07-20"
  s.summary = "JavaScript and CSS minification library"
  s.email = "sstephenson@gmail.com"
  s.description = "A Ruby interface to YUI Compressor for minifying JavaScript and CSS assets."
  s.homepage = "http://github.com/sstephenson/ruby-yui-compressor/"
  s.rubyforge_project = "yui"
  s.has_rdoc = true
  s.authors = ["Sam Stephenson"]
  s.files = Dir["Rakefile", "lib/**/*", "test/**/*", "vendor/**/*"]
  s.test_files = Dir["test/test_*.rb"] unless $SAFE > 0
end