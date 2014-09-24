require 'nokogiri'
require 'erb'

module RubyDragon

end

#class RubyDragon::Commands::Parser
#  attr_reader :xml
#  def initialize(file_path)
#    @xml = Nokogiri::XML.parse(File.read(file_path))
#  end
#end

module RubyDragon::Builder
  class Command
    @@type = "Command"
    @@counter = 0
    attr_accessor :app
    attr_reader :word, :keys, :app

    def initialize word, keys
      keys = [keys] unless keys.is_a?(Array)
      @word = word
      @keys = keys
      @action_id = @@counter += 1
      @trigger_id = @@counter += 1
      @command_id = @@counter += 1
    end

    def to_xml
      command + trigger + action
    end

    def random_command_id
      (rand * 999999999).to_i
    end

    private

    def command
      parse_erb :command
    end

    def trigger
      parse_erb :trigger
    end

    def action
      parse_erb :action
    end

    def parse_erb(file_name)
      ERB.new(File.read("_#{file_name}.xml.erb")).result(binding)
    end
  end

  class Keystroke < Command
    @@type = "Keystroke"
    @@desc = %(saying "%s" presses "%s".)

    def inspect
      "<Keystroke '#{word}'=>'#{keys.join(' ')}'>"
    end

    def desc
      require 'cgi'
      CGI.escapeHTML @@desc % [word, keys.join(' ')]
    end
  end

  class App
    attr_reader :name, :version, :commands
    def initialize(name, version)
      @name = name
      @version = version
      @commands = []
    end

    def to_xml
      @body = commands.map(&:to_xml).join
      ERB.new(File.read("database.xml.erb")).result(binding)
    end

    def <<(command)
      command.app = self
      commands << command
    end
  end
end
