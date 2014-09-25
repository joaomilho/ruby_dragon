##
# Implements Text Macro commands
##
module RubyDragon
  class Text < Command
    @@desc = %(saying "%s" types "%s".)

    def type
      'Text'
    end

    def inspect
      "<Keystroke '#{word}'=>'#{keys.join(' ')}'>"
    end

    def desc
      require 'cgi'
      CGI.escapeHTML @@desc % [word, keys.join(' ')]
    end
  end
end
