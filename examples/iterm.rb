require 'bundler/setup'
Bundler.setup
require 'ruby_dragon'

include RubyDragon

mvim = App.from_yaml("examples/iterm.yml")
mvim.save("export/iterm.commandstext")

