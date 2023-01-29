import Foundation

// 유니온파인드
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var parent:[Int] = []
var adjList:[[String]] = []

func find(_ x: Int) -> Int{
    if parent[x] == x {
        return x
    }else{
        parent[x] = find(parent[x])
        return parent[x]
    }
}

func uion(_ x: Int, _ y: Int){
    let pX = find(x)
    let pY = find(y)
    if parent[pX] == parent[pY] { return }
    if pX > pY {
        parent[pX] = parent[pY]
    } else if pX < pY{
        parent[pY] = parent[pX]
    }
}

for _ in 1...n{
    adjList.append(readLine()!.components(separatedBy: " "))
}

// parent 초기화
for i in 0..<n{ parent.append(i) }

for row in 0..<n{
    for col in 0..<n{
        if adjList[row][col] == "1"{
            uion(row,col)
        }
    }
}

var answer:[Int] = []
var string = "YES"
for node in readLine()!.components(separatedBy: " "){
    if answer.isEmpty{
        answer.append(parent[Int(node)!-1])
    }else {
        if answer.last! != parent[Int(node)!-1]{
            string = "NO"
            break
        }
    }
}

print(string)
