str = gets.chomp
str.gsub! 'eraser', ''
str.gsub! 'erase', ''
str.gsub! 'dreamer', ''
str.gsub! 'dream', ''
puts (str.size == 0) ? 'YES' : 'NO'
