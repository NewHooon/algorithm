import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    
    var answer = 0
    var bottleCount = n
    while bottleCount >= a {
        answer += (bottleCount / a) * b
        bottleCount = (bottleCount / a) * b + bottleCount % a
    }
    return answer
}
