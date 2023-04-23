import Foundation

let nm = readLine()!.split(separator: " ").map{Int($0)!}
let n = nm[0], m = nm[1]
var pAnswer = Int.max
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
var office:[[Int]] = []
var cctv:[(Int,Int)] = []
var copyBoard:[[Int]] = []
var cctvDirArr:[[[Int]]] = []

for _ in 1...n{ office.append(readLine()!.split(separator: " ").map{Int($0)!}) }

var cctvOne = [[1,0,0,0], [0,1,0,0], [0,0,1,0], [0,0,0,1]]
var cctvTwo = [[0,1,0,1], [1,0,1,0]]
var cctvThree = [[1,1,0,0], [0,1,1,0], [0,0,1,1], [1,0,0,1]]
var cctvFour = [[1,1,0,1], [1,1,1,0], [0,1,1,1], [1,0,1,1]]
var cctvFive = [[1,1,1,1]]

cctvDirArr.append(cctvOne)
cctvDirArr.append(cctvTwo)
cctvDirArr.append(cctvThree)
cctvDirArr.append(cctvFour)
cctvDirArr.append(cctvFive)

//        append(Idx)
func checkOffice() -> Int {
    var answer = 0
    for row in 0..<n{
        for col in 0..<m {
            if copyBoard[row][col] == 0 { answer += 1 }
        }
    }
    
    return answer
}
// 주어진 방향으로 cctv 지도에 표시
func cctvRangeDraw(_ dirArr: [Int], _ startXY: (Int,Int)){
    for dir in dirArr {
        var x = startXY.0
        var y = startXY.1
        while true{
            x += dx[dir]
            y += dy[dir]
            if (0..<n) ~= x && (0..<m) ~= y {
                if 6 == copyBoard[x][y]  {
                    break
                }else if copyBoard[x][y] == 0{
                    copyBoard[x][y] =  9
                }
            }else{
                break
            }
        }
    }
}

//(1) cctv위치 파악
for row in 0..<n {
    for col in 0..<m{
        if (1...5) ~= office[row][col] {
            cctv.append((row,col))
        }
    }
}

//(2) dfs
func dfs(_ depth: Int, _ tempBoard: [[Int]]){
    if depth == cctv.count{
        let compareValue = checkOffice()
        pAnswer = pAnswer < compareValue ? pAnswer : compareValue
    }else {
        let startX = cctv[depth].0
        let startY = cctv[depth].1
        var dirIdx: [Int] = []
        for cctvDir in cctvDirArr[office[startX][startY] - 1] {
            dirIdx = []
            for idx in 0..<cctvDir.count { if cctvDir[idx] == 1 { dirIdx.append(idx) } }
            copyBoard = tempBoard
            cctvRangeDraw(dirIdx, (startX,startY))
            dfs(depth+1, copyBoard)
        }
    }
}

copyBoard = office
dfs(0, office)
print(pAnswer)

