require_relative 'ruby_dragon'

include RubyDragon::Commands::Builder

mvim = App.new("org.vim.MacVim", 1)
mvim << Keystroke.new("delete", :d)
mvim << Keystroke.new("delete line", %w[d d])

mvim.to_xml


#<< Keystroke.new("delete line", %w[d d])

