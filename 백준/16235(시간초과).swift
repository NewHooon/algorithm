import Foundation

let nmk = readLine()!.split(separator: " ").map{Int($0)!}
var n = nmk[0], m = nmk[1], k = nmk[2]

let dx = [-1,-1,-1,0,0,1,1,1 ]
let dy = [-1,0,1,-1,1,-1,0,1]
var answer = 0
//(1) 각 칸마다 추가될 영양분
var arrayA:[[Int]] = []
//(2) 각 칸의 나무 상태
var treeCheck:[[[Int]]] = Array(repeating: Array(repeating: [], count: n), count: n)
//(3) 각 칸의 양분상태
var treeArr:[[Int]] = Array(repeating: Array(repeating: 5, count: n), count: n)


//Arr
for _ in 1...n{
    arrayA.append(readLine()!.split(separator: " ").map{Int($0)!})
}

// (2) 각 칸의 나무 표시
for _ in 1...m{
    let xyz = readLine()!.split(separator: " ").map{Int($0)!}
    treeCheck[xyz[0]-1][xyz[1]-1].append(xyz[2])
}

while k > 0 {
    //(1) 봄
    var growthTree:[(Int,Int,Int)] = []
    var deathTree:[(Int, Int, Int)] = []
    
    for row in 0..<n{
        for col in 0..<n{
            var surviveTree:[Int] = []
            var treeQ = treeCheck[row][col]
            for tree in treeQ {
                if treeArr[row][col] - tree >= 0 {
                    surviveTree.append(tree+1)
                    treeArr[row][col] -= tree
                    if (tree+1) % 5 == 0 { growthTree.append((row,col,tree+1)) }
                }else{
                    deathTree.append((row,col,tree))
                }
            }
            treeCheck[row][col] = surviveTree
        }
    }
    //(2) 여름
    for tree in deathTree {
        let nutrition = tree.2 / 2
        treeArr[tree.0][tree.1] += nutrition
    }
    //(3) 가을
    for tree in growthTree {
        for dir in 0...7{
            let nx = dx[dir] + tree.0
            let ny = dy[dir] + tree.1
            if (0..<n) ~= nx && (0..<n) ~= ny {
                treeCheck[nx][ny] = [1] + treeCheck[nx][ny]
            }
        }
    }
    //겨울
    for row in 0..<n{
        for col in 0..<n{
            treeArr[row][col] += arrayA[row][col]
        }
    }
    k -= 1
}

for row in 0..<n{
    for col in 0..<n{
        answer += treeCheck[row][col].count
    }
}

print(answer)
