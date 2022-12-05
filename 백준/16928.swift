import Foundation

class Queue<T>{
    var enQueue:[T] = []
    var deQueue:[T] = []
    
    var isEmpty:Bool{
        return enQueue.isEmpty && deQueue.isEmpty
    }
    
    func push(_ item: T){
        enQueue.append(item)
    }
    
    func pop() -> T {
        if deQueue.isEmpty{
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
}


let input = readLine()!.split(separator: " ")
let n = Int(input[0])!
let m = Int(input[1])!

let startN = 1
let move = [1,2,3,4,5,6]

var moveDictionary: [Int : Int] = [:]
var gameBoard = Array(repeating: Int.max, count: 101)

for _ in 1...n+m{
    let line = readLine()!.split(separator: " ")
    moveDictionary[Int(line[0])!] = Int(line[1])!
}

func BFS(){
    let q = Queue<(position: Int, depth: Int)>()
    q.push((1,0))
    while !q.isEmpty{
        let temp = q.pop()
        for value in move{
            var nextPosition = temp.position + value
            if moveDictionary[nextPosition] != nil { nextPosition = moveDictionary[nextPosition]! }
            if (1...100) ~= nextPosition && gameBoard[nextPosition] > temp.depth + 1 {
                gameBoard[nextPosition] = temp.depth + 1
                q.push((nextPosition,temp.depth + 1))
            }
        }
    }
}

BFS()
print(gameBoard[100])






