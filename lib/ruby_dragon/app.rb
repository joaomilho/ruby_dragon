module RubyDragon
  class App
    @@counter = 0

    attr_reader :name, :version, :commands

    def self.from_yaml(file_path)
      require 'yaml'
      hash = YAML.load_file(file_path)
      new(hash["app"]["name"], hash["app"]["version"]).tap do |app|
        (hash["keystrokes"] || []).each do |word, keys|
          app << Keystroke.new(word, keys)
        end
        (hash["texts"] || []).each do |word, keys|
          app << Text.new(word, keys)
        end
      end
    end

    def initialize(name, version)
      @name = name
      @version = version
      @commands = []
      @@counter = 0
    end

    def to_xml
      @body = commands.map(&:to_xml).join
      ERB.new(File.read("#{RubyDragon.path}/templates/database.xml.erb")).result(binding)
    end

    def save path
      File.write(path, to_xml)
    end

    def <<(command)
      command.app = self
      command.action_id = @@counter += 1
      command.trigger_id = @@counter += 1
      command.command_id = @@counter += 1
      commands << command
    end
  end
end
