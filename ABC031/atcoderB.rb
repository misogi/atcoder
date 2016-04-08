l, h = gets.chomp.split(' ').map(&:to_i)
n = gets.chomp.to_i
n.times do 
  work = gets.chomp.to_i
  ans = 0
  if work < l
    ans = l - work
  elsif h < work
    ans = -1
  end
  puts ans   
end
