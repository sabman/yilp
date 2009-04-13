require "rubygems"
require "rake"
require "echoe"

Echoe.new('yilp', '0.1') do |p|
  p.description     = "Ruby wrapper arround Yahoo Internet Location Platform" 
# p.url             = "http://github.com/sabman/yilp"  
  p.url             = "http://yilp.rubyforge.org"
  p.author          = "Shoaib Burq & David Troy"
  p.email           = "shoaib@nomad-labs.com"
  p.ignore_pattern  = ["tmp/*", "script/*"]
  p.development_dependencies =  ["active_support"]
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }