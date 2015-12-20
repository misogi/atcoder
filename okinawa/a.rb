h, w, k = gets.split.map(&:to_i)
islands_num = k
flip_h = true
lines = []

h.times do
  line = ""
  if flip_h
    flip_w = true
    w.times do
      if islands_num > 0
        if flip_w
          line << '#'
          islands_num = islands_num - 1
        else
          line << '.'
        end
        flip_w = !flip_w
      else
        line << '.'
      end
    end
  else
    line = '.' * w
  end
  flip_h = !flip_h
  lines.push line
end

if islands_num == 0
  lines.each{|l| puts l}
else
  puts 'IMPOSSIBLE'
end
