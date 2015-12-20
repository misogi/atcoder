a, d = gets.chomp.split(' ').map(&:to_i)
aa = (a+1) * d
dd = a * (d+1)
ans = dd > aa ? dd : aa
puts ans
