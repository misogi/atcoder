n, qnum = gets.chomp.split(' ').map(&:to_i)

board = []
n.times do |i|
  arr = []
  n.times do |j|
    arr[j] = 0
  end
  board[i] = arr
end

qnum.times do
  q, a, b, c, d = gets.chomp.split(' ').map(&:to_i)
  if q == 1
    n.times do |i|
      n.times do |j|
        ij = i + j
        if a <= ij && ij <= b
          board[i][j] += c
        end
      end
    end
  elsif q == 2
    n.times do |i|
      n.times do |j|
        ij = i - j
        if a <= ij && ij <= b
          board[i][j] += c
        end
      end
    end
  else
    max = -100000
    maxnum = 0
    (a..b).each do |i|
      (c..d).each do |j|
        t = board[i][j]
        if max < t
          maxnum = 1
          max = t
        elsif max == t
          maxnum += 1
        end
      end
    end
    puts "#{max} #{maxnum}"
  end
end
