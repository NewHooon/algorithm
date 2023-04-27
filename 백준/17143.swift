import Foundation
 
struct Shark{
    var isAlive: Bool
    var r: Int
    var c: Int
    var s: Int
    var d: Int
    var z: Int
}

let rcm = readLine()!.split(separator: " ").map{Int($0)!}
let r = rcm[0], c = rcm[1], m = rcm[2]
let dx = [-1,1,0,0], dy = [0,0,1,-1]

var sharkArr:[[Int]] = []
var sharkMap:[[Shark]] = Array(repeating: Array(repeating: Shark(isAlive: false, r: 0, c: 0, s:  0, d: 0, z: 0), count: c), count: r)
var personPosition = 0
var answer = 0
///  r c s d z
for _ in 0..<m{
    sharkArr.append(readLine()!.split(separator: " ").map{Int($0)!})
}

for shark in sharkArr {
    let r = shark[0]
    let c = shark[1]
    let s = shark[2]
    let d = shark[3]
    let z = shark[4]
    sharkMap[r-1][c-1] = Shark(isAlive: true, r: r-1, c: c-1, s: s, d: d-1, z: z)
}

while personPosition < c {
    // (1) 상어 잡기
    var undergroundPosition = 0
    while undergroundPosition < r {
        if sharkMap[undergroundPosition][personPosition].isAlive {
            answer += sharkMap[undergroundPosition][personPosition].z
            sharkMap[undergroundPosition][personPosition].isAlive = false
            break
        }
        undergroundPosition += 1
    }
    
    // (2) 상어이동
    var movingShark:[Shark] = []
    for row in 0..<r {
        for col in 0..<c {
            let shark = sharkMap[row][col]
            if shark.isAlive {
                var moveCnt = shark.s
                var moveDir = shark.d
                var positionX = shark.r
                var positionY = shark.c
                if moveDir == 0 || moveDir == 1 { moveCnt %= (r-1)*2}
                else { moveCnt %= (c-1)*2}
                while moveCnt > 0 {
                    let nx = dx[moveDir] + positionX
                    let ny = dy[moveDir] + positionY
                    if (0..<r) ~= nx && (0..<c) ~= ny {
                        positionX = nx
                        positionY = ny
                    }else{
                        if moveDir == 0 { moveDir = 1 }
                        else if moveDir == 1 { moveDir = 0 }
                        else if moveDir == 2 { moveDir = 3 }
                        else if moveDir == 3 { moveDir = 2 }
                        positionX += dx[moveDir]
                        positionY += dy[moveDir]
                    }
                    moveCnt -= 1
                }
                movingShark.append(Shark(isAlive: true, r: positionX, c: positionY, s: shark.s, d: moveDir, z: shark.z))
                sharkMap[shark.r][shark.c].isAlive = false
            }
        }
    }
    
    // (2) 상어이동 후 재배치
    for shark in movingShark {
            if sharkMap[shark.r][shark.c].isAlive{
            if sharkMap[shark.r][shark.c].z < shark.z{
                sharkMap[shark.r][shark.c] = shark
            }
        }else{
            sharkMap[shark.r][shark.c] = shark
        }
    }
    personPosition += 1
}
print(answer)
