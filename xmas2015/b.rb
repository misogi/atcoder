n, m = gets.chomp.split(' ').map(&:to_i)
brokens = {}

m.times do
  broke_from, broke_to = gets.chomp.split(' ').map(&:to_i).sort
  brokens[broke_from] ||= []
  brokens[broke_from] << broke_to
end

require 'pp'

connected = []
nodes = []

(1..(n-1)).each do |from|
  br = brokens[from]
  node = nil
  tos = ((from+1)..n).to_a
  not_conns = tos - connected
  conns = tos & connected
  conns.each do |to|
    if !br || !(br.include? to)
      connected << from
      node = [from, to]
      break
    end
  end

  unless node
    not_conns.each do |to|
      if !br || !(br.include? to)
        connected << to
        connected << from
        node = [from, to]
        break
      end
    end
  end

  nodes << node if node
end

if nodes.size == (n-1)
  puts 'Yes'
  nodes.each do |no|
    puts no.join(' ')
  end
else
  puts 'No'
end
