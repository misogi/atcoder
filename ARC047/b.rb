n = gets.chomp.to_i

xyms = {}
xyss = {}
xyms_ans = []
xyss_ans = []

n.times do
  x, y = gets.chomp.split(' ').map(&:to_i)
  xym = x - y
  xys = x + y
  if xyms[xym]
    xyms_ans << xym
  else
    xyms[xym] = 1
  end

  if xyss[xys]
    xyss_ans << xys
  else
    xyss[xys] = 1
  end
  puts xym, xys
end

puts xyss_ans
puts xyms_ans
