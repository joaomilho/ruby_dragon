require 'erb'
require 'cgi'

module RubyDragon
  autoload :Command,     'ruby_dragon/command'
  autoload :Keystroke,   'ruby_dragon/keystroke'
  autoload :Text,        'ruby_dragon/text'
  autoload :AppleScript, 'ruby_dragon/apple_script'
  autoload :App,         'ruby_dragon/app'

  def self.path
    File.expand_path File.dirname(__FILE__)
  end
end
