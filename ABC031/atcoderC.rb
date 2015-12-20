n = gets.chomp.to_i
points = gets.chomp.split(' ').map(&:to_i)
mmaxa = -9999
mmaxt = -9999
n.times do |i|
  maxa = -9999
  maxt = -9999
  n.times do |j|
    next if i == j
    if i < j
      start = i
      e = j
    else
      start = j
      e = i
    end
    arr = points[start..e]
    suma = sumt = 0
    arr.each_with_index do |k, kindex|
      if kindex % 2 == 0
        sumt += k
      else
        suma += k
      end
    end
    if suma > maxa
      maxa = suma
      maxt = sumt
    end
  end
  if maxt > mmaxt
    mmaxa = maxa
    mmaxt = maxt
  end
end

puts mmaxt
