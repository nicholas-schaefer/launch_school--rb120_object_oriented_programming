class Minilang
  VALID_COMMANDS = [
    'ADD',  'DIV',  'MOD',
    'MULT', 'POP', 'PRINT',
    'PUSH', 'SUB'
  ]

  attr_reader :commands
  def initialize command
    @register = 0
    @stack = []
    @commands = command.split()
  end

  def eval
    commands.each do |command|
      is_valid_command = valid_command? command
      next if is_valid_command
      p "Invalid token #{command}"
      return
    end
    commands.each { |command| parse_command command}
    p "-------------"
    p "Register:  #{register}"
    p "Stack:     #{stack}"
  end

  private
  attr_accessor :register, :stack

  def valid_command? command
    ((VALID_COMMANDS.include? command) || (string_also_an_integer? command))
  end

  def parse_command command
    case
    when command == 'ADD'   then handle_command_add
    when command == 'DIV'   then handle_command_div
    when command == 'MOD'   then handle_command_mod
    when command == 'MULT'  then handle_command_mult
    when command == 'POP'   then handle_command_pop
    when command == 'PRINT' then handle_command_print
    when command == 'PUSH'  then handle_command_push
    when command == 'SUB'   then handle_command_sub
    else handle_command_integer command
    end
  end

  def handle_command_add
    self.register = register + handle_command_pop
  end

  def handle_command_div
    self.register = register / handle_command_pop
  end

  def handle_command_integer command
    self.register = command.to_i
  end

  def handle_command_mod
    self.register = register % handle_command_pop
  end

  def handle_command_mult
    self.register = register * handle_command_pop
  end

  def handle_command_pop
    self.register = stack.pop
  end

  def handle_command_print
    p (register.nil? ? "Empty stack!" : register)
  end

  def handle_command_push
    stack.push register
  end

  def handle_command_sub
    self.register = register - handle_command_pop
    # handle_command_print
  end


  def string_also_an_integer? str
    !!(str =~ /\A-?\d+\Z/)
  end

end

def app

  # irb = Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT')
  # p irb.commands
  # irb.eval
  # return

  # Minilang.new('PRINT').eval
  # return
  # 0

  # Minilang.new('5 PUSH 3 MULT PRINT').eval
  # return
  # 15

  # Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
  # return
  # 5
  # 3
  # 8

  # Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
  # return
  # 10
  # 5

  # Minilang.new('5 PUSH POP POP PRINT').eval
  # return
  # Empty stack!

  # Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
  # return
  # 6

  # Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
  # return
  # 12

  # Minilang.new('-3 PUSH 5 XSUB PRINT').eval
  # return
  # Invalid token: XSUB

  # Minilang.new('-3 PUSH 5 SUB PRINT').eval
  # return
  # 8

  # Minilang.new('6 PUSH').eval
  # (nothing printed; no PRINT commands)
end
app()
