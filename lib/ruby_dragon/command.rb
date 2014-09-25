module RubyDragon
  class Command
    attr_accessor :app, :action_id, :trigger_id, :command_id
    attr_reader :word, :keys, :app

    def initialize word, keys
      keys = [keys] unless keys.is_a?(Array)
      @word = word
      @keys = keys
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
      ERB.new(File.read("#{RubyDragon.path}/templates/_#{file_name}.xml.erb")).result(binding)
    end
  end
end
