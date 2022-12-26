import Foundation

func solution(_ t:String, _ p:String) -> Int {
    var answer = 0, index = 0
    var tArr = t.map{String($0)}
    
    while index + p.count - 1 < t.count {
        if p >= tArr[index...index+p.count-1].joined() {
            answer += 1
        }
        index += 1
    }
    return answer
}
