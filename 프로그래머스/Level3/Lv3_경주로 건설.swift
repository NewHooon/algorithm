import Foundation

func solution(_ board:[[Int]]) -> Int {
    var answer = Int.max
    var head = 0
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    var queue:[(x: Int, y: Int, cost:Int, dir: Int)] = []
    var moneyBoard:[[[Int]]] = Array(repeating: Array(repeating: Array(repeating:Int.max, count: 4), count: board.count),count: board.count)
    queue.append((x:0,y:0, cost: 0, dir:-1))
    for dir in 0...3{ moneyBoard[0][0][dir] = 0 }
    while head < queue.count {
        let temp = queue[head]
        for dir in 0...3{
            var cost = 0
            let nx = temp.x + dx[dir]
            let ny = temp.y + dy[dir]
            if (0...board.count-1) ~= nx && (0...board.count-1) ~= ny && board[nx][ny] != 1{
                cost = (temp.dir == -1 || temp.dir == dir) ? 100 : 600
                if moneyBoard[nx][ny][dir] >= cost + temp.cost{
                    moneyBoard[nx][ny][dir] = cost + temp.cost
                    queue.append((x: nx, y: ny, cost: moneyBoard[nx][ny][dir], dir: dir))
                }
            }
        }
        head += 1
    }
    
    for dir in 0...3{
        let value = moneyBoard[board.count-1][board.count-1][dir]
        answer = answer > value ? value: answer
    }
    return answer
}
