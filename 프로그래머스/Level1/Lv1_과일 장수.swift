import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {

    var answer = 0, depth = 0
    var appleBox = score.sorted{ $0 > $1}

    while true{
        let nextIdx = m * depth + m - 1
        if (0..<score.count) ~= nextIdx{
            answer += appleBox[nextIdx] * m
            depth += 1
        }else{
            break
        }
    }

    return answer
}
