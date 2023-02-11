import Foundation

func solution(_ a:[Int], _ edges:[[Int]]) -> Int64 {
    
    var minV = 0
    var rootNode = 0
    var tree:[[Int]] = Array(repeating:[], count:a.count)
    
    for edge in edges{
        tree[edge[0]].append(edge[1])
        tree[edge[1]].append(edge[0])
    }
    
    // rootNode 찾기
    for node in 0..<a.count {
        if tree[node].count == 1 {
            rootNode = node
            break
        }
    }
    
    var visit:[Bool] = Array(repeating: false, count:a.count)
    
    func dfs(_ node: Int) -> Int{
        visit[node] = true
        
        var weight = a[node]
        
        for nextNode in tree[node] {
            if !visit[nextNode]{
                weight += dfs(nextNode)
            }
        }
        if weight > 0 {
            minV += weight
            return weight
        }else if weight < 0 {
            minV += -weight
            return weight
        }else{
            return 0
        }
    }
    
    var answer:Int64 = Int64(dfs(rootNode))
    return answer == 0 ? Int64(minV) : Int64(-1)
