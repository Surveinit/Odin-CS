POSSIBLE_MOVES = [
  [2, 1], [2, -1],
  [-2, 1], [-2, -1],
  [1, 2], [1, -2],
  [-1, 2], [-1, -2]
]

def valid_pos?(pos)
  x, y = pos
  return x.between?(0, 7) && y.between?(0, 7)
end

def knight_moves(start, destination)
  queue = [ [start, [start]] ]
  visited = Array.new(8) { Array.new(8, false) }
  visited[ start[0]][start[1] ] = true

  until queue.empty?
    current_pos, path = queue.shift
    return path if current_pos == destination

    POSSIBLE_MOVES.each do |dx, dy|
      new_pos = [ current_pos[0] + dx, current_pos[1] + dy ]

      if valid_pos?(new_pos) && !visited[new_pos[0]][new_pos[1]]
        queue << [ new_pos, path + [new_pos] ]
        visited[new_pos[0]][new_pos[1]] = true
      end
    end

  end

  return path

end
