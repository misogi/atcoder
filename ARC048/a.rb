s, e = gets.chomp.split(' ').map(&:to_i)
ans = (s*e) < 0 ? e-s-1 : e-s
puts ans
