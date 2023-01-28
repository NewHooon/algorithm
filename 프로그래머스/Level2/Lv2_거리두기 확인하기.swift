import Foundation

func solution(_ places:[[String]]) -> [Int] {
    var answer:[Int] = []
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    
    func checkDistance(_ startX: Int, _ startY: Int, _ placeArr: [[String]]) -> Bool{
        var index = 0
        var q: [(x:Int,y:Int, depth:Int)] = []
        var visit = Array(repeating:Array(repeating:false,count:5),count:5)
        visit[startX][startY] = true
        q.append((x: startX, y: startY, depth: 0))
        while index < q.count {
            let temp = q[index]
            if index != 0 && placeArr[temp.x][temp.y] == "P" && temp.depth<=2{
                return false
            }
            for dir in 0...3{
                let nx = temp.x + dx[dir]
                let ny = temp.y + dy[dir]
                if (0...4) ~= nx && (0...4) ~= ny && (placeArr[nx][ny] != "X") && !visit[nx][ny]  {
                    q.append((x: nx, y: ny, temp.depth+1))
                    visit[nx][ny] = true
                }
            }
            index += 1
        }
        return true
    }

    for place in places{
        var isNotDistance = false
        var placeArr:[[String]] = []
        for testCase in place{
            placeArr.append(testCase.map{String($0)})
        }
        for row in 0...4{
            for col in 0...4{
                if placeArr[row][col] == "P" {
                    if !checkDistance(row, col, placeArr){
                        isNotDistance = true
                        break
                    }
                }
            }
            if isNotDistance { break }
        }
        if isNotDistance {
            answer.append(0)
        }else{
            answer.append(1)
        }
    }
    
    return answer
}
