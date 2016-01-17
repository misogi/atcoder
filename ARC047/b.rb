def compare_distance(ans, n, xs, ys)
  x, y = ans
  px = (x + y) / 2
  py = (x - y) / 2
  dist = nil
  n.times do |i|
    dd = (xs[i] - px).abs + (ys[i] - py).abs
    if dist && dist != dd
      return false
    end
    dist = dd
  end

  puts "#{px} #{py}"
  true
end

n = gets.chomp.to_i

a = []
b = []
xs = []
ys = []

n.times do
  x, y = gets.chomp.split(' ').map(&:to_i)
  xs << x
  ys << y
  a << x + y
  b << x - y
end

amax = a.max
amin = a.min
bmax = b.max
bmin = b.min
d = [amax-amin, bmax-bmin].max.div(2)
answers = [[amin+d, bmin+d], [amin+d, bmax-d], [amax-d, bmin+d], [amax-d, bmax-d]]

answers.each do |ans|
  exit if compare_distance(ans, n, xs, ys)
end
