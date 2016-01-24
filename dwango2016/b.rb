n = gets.chomp.to_i
ks = gets.chomp.split(' ').map(&:to_i)
anss = []
n.times do |i|
  a = i == 0 ? 1000000000 : ks[i-1]
  b = ks[i] || 1000000000
  anss[i] = a < b ? a : b
end

puts anss.join(' ')
