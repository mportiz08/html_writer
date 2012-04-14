$:.unshift File.expand_path("../lib", __FILE__)
require 'html_writer'

Gem::Specification.new do |s|
  s.name        = 'html_writer'
  s.version     = HtmlWriter.VERSION
  s.summary     = 'a small DSL for writing HTML'
  s.description = s.summary
  s.author      = 'Marcus Ortiz'
  s.email       = 'mportiz08@gmail.com'
  s.homepage    = 'https://github.com/mportiz08/html_writer'
  s.files       = Dir["README.md", "LICENSE.md", "lib/**/*.rb"]
end
