##
# Implements Text Macro commands
##
module RubyDragon
  class AppleScript < Command
    @@desc = %(saying "%s" runs a script.)

    def type
      'AppleScript'
    end

    def inspect
      "<Keystroke '#{word}'=>'#{keys.join(' ')}'>"
    end

    def desc
      CGI.escapeHTML @@desc % word
    end
  end
end
