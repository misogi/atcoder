w, h = gets.chomp.split(' ').map(&:to_i)
ans = if (w / 4) == (h / 3)
  '4:3'
else
  '16:9'
end

puts ans
