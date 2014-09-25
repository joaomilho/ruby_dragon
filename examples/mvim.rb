require 'bundler/setup'
Bundler.setup
require 'ruby_dragon'

include RubyDragon

mvim = App.from_yaml("examples/mvim.yml")

#puts mvim.to_xml

mvim.save("mvim.commandstext")
