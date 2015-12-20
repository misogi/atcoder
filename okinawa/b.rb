num, men, soup = gets.chomp.split(' ').map(&:to_i)
sobas = []
soup_sum = 0
num.times do
  m, s = gets.chomp.split(' ').map(&:to_i)
  soup_sum += s
  sobas.push [m, s]
end

if soup_sum < soup
  puts -1
  exit
end

# (1..num+1)
(1..num).each do |i|
  select_sobas = sobas.combination(i)
  select_sobas.each do |pattern|
    selmen = 0
    selsoup = 0
    pattern.each do |soba|
      selmen += soba[0]
      selsoup += soba[1]
    end
    if selsoup >= soup
      remain = selsoup - soup
      if (selmen + remain) >= men
        puts i
        exit
      end
    end
  end
end

puts -1
