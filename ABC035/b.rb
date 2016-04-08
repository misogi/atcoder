route = gets.chomp
type = gets.chomp.to_i

w = 0
h = 0
q = 0
route.each_char do |c|
  case c
  when 'L'
    w = w - 1
  when 'R'
    w = w + 1
  when 'U'
    h = h + 1
  when 'D'
    h = h - 1
  when '?'
    q = q + 1
  end
end

ans = w.abs + h.abs
if type == 1
  ans = ans + q
else
  ans = ans - q
end
puts ans
