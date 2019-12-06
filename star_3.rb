module OpcodeComputer 
  # Opcodes
  # 99: means that the program is finished and should immediately halt
  # 1: adds together numbers read from two positions and stores the result in a third position
  #   - The three numbers after 1, describe the three positions
  # 2: works exactly like opcode 1, except it multiplies the two inputs
  ADDITION = 'ADDITION'
  MUTIPLICATION = 'MUTIPLICATION'

  def self.math(opcodes, index, action)
    value_1 = opcodes[opcodes[index + 1]]
    value_2 = opcodes[opcodes[index + 2]]
    override_position = opcodes[index + 3]

    if (action == ADDITION) 
      value = value_1 + value_2
    else
      value = value_1 * value_2
    end
    
    opcodes[override_position] = value
    
    opcodes
  end

  def self.opcode_computer(opcodes)
    index = 0

    loop do
      break unless index < opcodes.length
      opcode = opcodes[index]
      # find action to perform
      case opcode
        when 1
          opcodes = self.math(opcodes, index, ADDITION)
        when 2
          opcodes = self.math(opcodes, index, MUTIPLICATION)
        else
          break
      end
      index += 4
    end
    return opcodes[0]
  end  
end


#opcodes = [1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,13,1,19,1,9,19,23,2,23,13,27,1,27,9,31,2,31,6,35,1,5,35,39,1,10,39,43,2,43,6,47,1,10,47,51,2,6,51,55,1,5,55,59,1,59,9,63,1,13,63,67,2,6,67,71,1,5,71,75,2,6,75,79,2,79,6,83,1,13,83,87,1,9,87,91,1,9,91,95,1,5,95,99,1,5,99,103,2,13,103,107,1,6,107,111,1,9,111,115,2,6,115,119,1,13,119,123,1,123,6,127,1,127,5,131,2,10,131,135,2,135,10,139,1,13,139,143,1,10,143,147,1,2,147,151,1,6,151,0,99,2,14,0,0]
#puts OpcodeComputer::opcode_computer(opcodes)
