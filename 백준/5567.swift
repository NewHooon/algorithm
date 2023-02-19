import Foundation


let n = Int(readLine()!)!
let m = Int(readLine()!)!
var adjList:[[Int]] = Array(repeating: [], count: n+1)
var visit:[Bool] = Array(repeating: false, count: n+1)
var answer = 0
for _ in 1...m{
    let person = readLine()!.split(separator:" ").map{Int($0)!}
    adjList[person[0]].append(person[1])
    adjList[person[1]].append(person[0])
}

func dfs(_ startNode: Int, _ depth: Int){
    visit[startNode] = true
    if depth == 2 { return }
    for friend in adjList[startNode]{
        if !visit[friend]{
            answer += 1
            dfs(friend,depth+1)
        } else{
            dfs(friend,depth+1)
        }
    }
}

dfs(1,0)
print(answer)
