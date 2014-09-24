require_relative 'ruby_dragon'
RSpec.configure do |c|
  c.fail_fast = true
end

include RubyDragon::Builder
describe App do

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

    expected = File.read("terminal.xml")
    expected.lines.each_with_index do |line, index|
      it "should work #{index}!" do
        expect(@result[index]).to eq(line)
      end
    end
  end
end