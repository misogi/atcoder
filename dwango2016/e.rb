n, l = gets.chomp.split(' ').map(&:to_i)
dists = {}
n.times do |n|
  t, d = gets.chomp.split(' ').map(&:to_i)
  dists[t] ||= []
  dists[t] << d
end

stand_anss = []
l.times do |stand|
  anss = []
  dists.each do |t, dist|
    ans = 0
    dist.each do |d|
      ans += (d - stand).abs
    end
    anss << ans
  end
  stand_anss[stand] = anss
end

require 'pp'
pp stand_anss
