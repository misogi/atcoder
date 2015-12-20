n = gets.chomp.to_i

require 'pp'
is_tate = true
all_blocks = []
all_avail = 0
n.times do
  if is_tate
    bl = gets.chomp
    gets
    gets
    blocks = bl
  else
    bl1 = gets.chomp
    bl2 = gets.chomp
    bl3 = gets.chomp
    blocks = bl1[0] << bl2[0] << bl3[0]
  end

  available = 0
  if blocks == '###'
    available = 2
  elsif blocks == '.##'
    available = 1
  elsif blocks == '##.'
    available = 1
  else
    available = 0
  end

  all_avail += available

  is_tate = !is_tate
end

puts (all_avail % 2 == 0) ? 'Snuke' : 'Sothe'
