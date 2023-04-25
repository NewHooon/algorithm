import Foundation

let n = Int(readLine()!)!
var board:[[Int]] = []
// 샤크     x좌표 y좌표 무게
var shark:(Int, Int, Int) = (0,0,0)
var levelCnt = 2
var answer: Int = 0

let dx = [1,0,-1,0]
let dy = [0,1,0,-1]

class Queue<T>{
    var enQueue:[T] = []
    var deQueue:[T] = []
    var isEmpty:Bool{ return enQueue.isEmpty && deQueue.isEmpty }
    func push(_ item:T) { enQueue.append(item) }
    func pop() -> T {
        if deQueue.isEmpty {
            deQueue = enQueue.reversed()
            enQueue = []
        }
        return deQueue.popLast()!
    }
}

func findFish() -> Bool {
    let q = Queue<(Int,Int,Int)>()
    var minTime = Int.max
    var fishArr:[(Int,Int,Int)] = []
    var visitCheck:[[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    visitCheck[shark.0][shark.1] = true
    q.push((shark.0,shark.1,0))
    
    while !q.isEmpty {
        let temp = q.pop()
        for dir in 0...3{
            let nx = dx[dir] + temp.0
            let ny = dy[dir] + temp.1
            // 보드 안에 속하는지
            if (0..<n) ~= nx && (0..<n) ~= ny && !visitCheck[nx][ny] {
                //물고기를 잡았다면 이동 X
                if (board[nx][ny] > shark.2) { continue }
                 // 상어와 크기가 같거나, 빈 공간인 경우 지나간다. (단, 먹을 수 있는 물고기가 이미 있는 경우 이동 금지)
                if (board[nx][ny] == shark.2 || board[nx][ny] == 0) && fishArr.isEmpty  {
                    visitCheck[nx][ny] = true
                    q.push((nx,ny,temp.2+1))
                    //  상어보다 크기가 같고, 빈 공간이 아닌 경우 먹을 수 있는 리스트에 포함
                }else if board[nx][ny] < shark.2 && board[nx][ny] != 0 {
                    if minTime >= temp.2+1 {
                        minTime = temp.2+1
                        visitCheck[nx][ny] = true
                        fishArr.append((nx,ny,temp.2+1))
                    }
                }
            }
        }
    }
    if fishArr.isEmpty {
        return false
    }else{
        fishArr.sort{
            if $0.0 == $1.0 {
                return $0.1 < $1.1
            }
            return $0.0 < $1.0
        }
        //
        levelCnt -= 1
        if levelCnt == 0{
            shark.2 += 1
            levelCnt = shark.2
        }
        board[shark.0][shark.1] = 0
        shark.0 = fishArr[0].0
        shark.1 = fishArr[0].1
        answer += fishArr[0].2
        board[fishArr[0].0][fishArr[0].1] = 9
        return true
    }
    
}

// (1) init Board
for _ in 1...n{
    board.append(readLine()!.split(separator: " ").map{Int($0)!})
}

// (2) 상어 위치
for row in 0..<n{
    for col in 0..<n{
        if board[row][col] == 9 {
            shark = (row,col,2)
            break
        }
    }
}
 
while findFish() {}


print(answer)

