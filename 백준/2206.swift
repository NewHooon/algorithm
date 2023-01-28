import Foundation

final class Queue<T>{
    private var enQueue:[T] = []
    private var deQueue:[T] = []
    var isEmpty:Bool{
        return enQueue.isEmpty && deQueue.isEmpty
    }
    
    func push(_ item: T){
        enQueue.append(item)
    }
    
    func pop() -> T{
        if deQueue.isEmpty{
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
}

let input = readLine()!.components(separatedBy: " ")
let n = Int(input[0])!, m = Int(input[1])!
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var board:[[String]] = []
var checkVisit = Array(repeating:Array(repeating:Array(repeating:false, count:2),count:m),count:n)
for row in 0..<n{
      board.append(readLine()!.map{String($0)})
}

func bfs() -> Int {
    let q = Queue<(x:Int, y: Int, chance: Int, depth: Int)>()
    q.push((x:0,y:0,chance:1,depth:1))
    checkVisit[0][0][1] = true
    while !q.isEmpty{
        let temp = q.pop()
        if temp.x + 1 == n && temp.y + 1 == m {
            return temp.depth
        }
        for dir in 0...3{
            let newX = temp.x + dx[dir]
            let newY = temp.y + dy[dir]
          
            if (0...n-1) ~= newX && (0...m-1) ~= newY && !checkVisit[newX][newY][temp.chance]{
                if board[newX][newY] == "1" && temp.chance == 1 {
                         checkVisit[newX][newY][0] = true
                         q.push((x:newX,y:newY,chance:temp.chance-1,depth:temp.depth+1))
                }else if board[newX][newY] == "0"{
                    checkVisit[newX][newY][temp.chance] = true
                    q.push((x:newX,y:newY,chance:temp.chance,depth:temp.depth+1))
                }
            }
        }
    }
    return -1
}

print(bfs())









