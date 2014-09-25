module RubyDragon
  class Keystroke < Command
    @@desc = %(saying "%s" presses "%s".)

    def type
      'Keystroke'
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
