import Foundation

let n = Int(readLine()!)!

let dx = [1,0,-1,0]
let dy = [0,-1,0,1]
var board:[[Bool]] = Array(repeating:Array(repeating: false, count: 101), count: 101)
var answer = 0
func dfs(_ depth: Int, _ g: Int, _ startX: Int, _ startY: Int, _ dirArr:[Int]){
    if depth == g{
        return
    } else{
        var newDirArr:[Int] = []
        var nx = startX, ny = startY
        for dir in dirArr.reversed() {
            let nd = (dir + 1) % 4
            nx += dx[nd]
            ny += dy[nd]
            board[ny][nx] = true
            newDirArr.append(nd)
        }
        dfs(depth+1, g, nx,ny, dirArr + newDirArr)
    }
}

for _ in 1...n{
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    let x = input[0]
    let y = input[1]
    let d = input[2]
    let g = input[3]
    board[y][x] = true
    board[y + dy[d]][x + dx[d]] = true
    dfs(0, g, x+dx[d] ,y + dy[d], [d])
}

for i in board.indices{
    for j in board.indices{
        if board.indices ~= i+1 && board.indices ~= j+1 {
            if board[i][j] && board[i+1][j] && board[i][j+1] && board[i+1][j+1]{
                answer += 1
            }
        }
    }
}

print(answer)
