class BracketCheck
  def self.run(str)
    new(str).run
  end

  def initialize(str)
    @chars = str.split('')
    @stack = []
    @brackets = { '{' => '}', '(' => ')', '[' => ']', '<' => '>' }
  end

  def run
    bracket_existance = false
    chars.each do |char|
      case char
      when '(', '{', '[', '<'
        bracket_existance = true
        stack.push(char)
      when ')', '}', ']', '>'
        return puts 'NG' unless brackets[stack.pop] == char
      end
    end
    puts bracket_existance ? 'OK' : 'No parentheses'
  end

  private

  attr_reader :chars, :stack, :brackets, :bracket_existance
end

BracketCheck.run(ARGV[0])
