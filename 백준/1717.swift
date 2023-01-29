import Foundation

let input = readLine()!.components(separatedBy:" ")
let n = Int(input[0])!, m = Int(input[1])!
var parent:[Int] = []

for i in 0...n{ parent.append(i) }

func find(_ x:Int) -> Int {
    if parent[x] == x { return x }
    parent[x] = find(parent[x])
    return parent[x]
}

func union(_ x:Int, _ y:Int){
    let pX = find(x)
    let pY = find(y)
    if pX == pY { return }
    else if pX < pY { parent[pY] = parent[pX] }
    else { parent[pX] = parent[pY] }
}

for _ in 1...m{
    let stringArr = readLine()!.components(separatedBy:" ")
    let (cmd, a, b) = (Int(stringArr[0])! ,Int(stringArr[1])!, Int(stringArr[2])!)
    let string = ""
    if cmd == 0{
        union(a,b)
    }else{
        print(find(a) == find(b) ? "YES" : "NO")
    }
}
