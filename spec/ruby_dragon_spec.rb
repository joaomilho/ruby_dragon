require_relative '../lib/ruby_dragon'

RSpec.configure do |c|
  c.fail_fast = true
end

include RubyDragon

describe App do

  describe "#from_yaml" do
    subject(:app) do
      App.from_yaml("spec/fixtures/mvim.yml")
    end

    it{ expect(app.name).to eq "org.vim.MacVim" }
    it{ expect(app.version).to eq 1 }
    it{ expect(app.commands.size).to eq 2 }
    it{ expect(app.commands.first.inspect).to eq "<Keystroke 'delete'=>'d'>" }
    it{ expect(app.commands.last.inspect).to eq "<Keystroke 'delete line'=>'d d'>" }
  end

  describe ".to_xml" do

    before(:all) do
      class Keystroke < Command
        def random_command_id
          "1234"
        end
      end
      @result = App.new("com.googlecode.iterm2", 1).tap do |terminal|
        terminal << Keystroke.new("CD", %i[c d])
        terminal << Keystroke.new("LS", %i[l s])
        terminal << Keystroke.new("SBT", %i[s b t])
        terminal << Keystroke.new("Enter", %i[Return])
      end.to_xml.lines
    end

    expected = File.read("spec/fixtures/terminal.xml")
    expected.lines.each_with_index do |line, index|
      it "should work #{index}!" do
        expect(@result[index]).to eq(line)
      end
    end
  end
end