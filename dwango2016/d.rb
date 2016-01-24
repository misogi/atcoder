n = gets.chomp.to_i
xss = []
n.times do |i|
  xs = gets.chomp.split(' ').map(&:to_i)
  xss << xs
end

def score(bo,i,j,k,l)
  sum = 0
  (i..i+k).each do |x|
    (j..j+l).each do |y|
      sum += bo[x][y]
    end
  end
  sum
end

scores = []
ijmax = []
n.times do |i|
  scores[i] ||= []
  ijmax[i] ||= []
  n.times do |j|
    ijmax[i][j] = -1000000000
    scores[i][j] ||= []
    (0..n-1-i).each do |k|
      scores[i][j][k] ||= []
      (0..n-1-j).each do |l|
        sc = score(xss, i,j,k,l)
        scores[i][j][k][l] = sc
        ijmax[i][j] = sc if ijmax[i][j] < sc
      end
    end
  end
end

max = -1000000000
n.times do |i|
  n.times do |j|
    start = scores[i][j]
    start.each_with_index do |ls, k|
      ls.each_with_index do |score, l|
        (i..n-1).each do |s|
          (j..n-1).each do |t|
            if s <= i+k && t <= j
              next
            end
            sc = score + ijmax[s][t]
            max = sc if max < sc
          end
        end
      end
    end
  end
end

puts max
