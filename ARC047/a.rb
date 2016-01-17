n, l = gets.chomp.split(' ').map(&:to_i)
s = gets.chomp

tabnum = 1
crash_num = 0
s.each_char do |c|
  if c == "+"
    tabnum += 1
    if l < tabnum
      tabnum = 1
      crash_num += 1
    end
  else
    tabnum -= 1
  end
end

puts crash_num
