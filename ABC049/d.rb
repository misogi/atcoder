n, k, l = gets.chomp.split.map(&:to_i)
ks = []
ls = []

k.times do
  a, b = gets.chomp.split.map(&:to_i)
  included = false
  ks.each do |kss|
    if kss.include?(a)
      kss << b
      included = true
      break
    elsif kss.include?(b)
      kss << a
      incuded = true
      break
    end
  end

  next if included

  ks << [a,b]
end

l.times do
  a, b = gets.chomp.split.map(&:to_i)
  included = false
  ls.each do |lss|
    if lss.include?(a)
      lss << b
      included = true
      break
    elsif lss.include?(b)
      lss << a
      included = true
      break
    end
  end

  next if included

  ls << [a,b]
end

# require 'pp'

ans = Array.new(n, 1)

ks.each do |kss|
  ls.each do |lss|
    sm = kss.uniq & lss.uniq
    next if sm.size < 2
    sm.each do |smm|
      ans[smm-1] += 1
    end
  end
end

puts ans.join(' ')