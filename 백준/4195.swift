import Foundation

let t = Int(readLine()!)!
var parent:[String: String] = [:]
var size:[String:Int] = [:]
var answer:[Int] = []

func find(_ x: String) -> String{
    if parent[x] != x{
        parent[x] = find(parent[x]!)
    }
    return parent[x]!
}

func union(_ x: String, _ y: String){
    let pX = find(x)
    let pY = find(y)
    if pX == pY { return }
    else if size[pX]! >= size[pY]! {
        parent[pY] = parent[pX]
        size[pX] = size[pX]! + size[pY]!
    }else{
        parent[pX] = parent[pY]
        size[pY] = size[pY]! + size[pX]!
    }
}

for _ in 1...t{
    let f = Int(readLine()!)!
    parent = [:]
    size = [:]
    for _ in 1...f{
        let friend = readLine()!.components(separatedBy: " ")
        let (a,b) = (friend[0],friend[1])
        if parent[a] == nil {
            parent[a] = a
            size[a] = 1
        }
        if parent[b] == nil {
            parent[b] = b
            size[b] = 1
        }
        union(a,b)
        answer.append(size[find(a)]!)
    }
}

for a in answer{ print(a) }
