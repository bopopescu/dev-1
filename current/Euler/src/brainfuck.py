def brain_luck(code, input):
  tape = [0 for i in range(256)]
  index = 0
  skip = False
  i = 0
  last = []
  output = ''
  while i < len(code):
      t = code[i]
      if skip and t != ']':
          pass
      elif skip and t == ']':
          skip = False
      elif t == ']':
          if len(last) > 0:
              j = last.pop()
              if tape[index] != 0:
                  i = j
                  last.append(j)
          
      elif t == '>':
          index = (index + 1) % 256
      elif t == '<'and index > 0:
          index -= 1
      elif t == '+':
          tape[index] = (tape[index] + 1) % 256
      
      elif t == '-':
          tape[index] = (tape[index] - 1) % 256
      elif t == '.':
          output += chr(tape[index])
      elif t == ',':
          tape[index] = ord(input[0])
          input = input[1:]
      elif t == '[' and tape[index] == 0:
          skip = True
      elif t == '[':
          last.append(i)
      i += 1
          
      
  return output
