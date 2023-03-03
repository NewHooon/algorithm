import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    
    var answer = 0
    var distance = 0
    var stack:[Int] = []
    for sectionNumber in section {
        if stack.isEmpty{
            stack.append(sectionNumber)
            answer += 1
        }else{
            distance += sectionNumber - stack.last!
            if distance < m {
                stack.append(sectionNumber)
            }else{
                stack = []
                stack.append(sectionNumber)
                answer += 1
                distance = 0
            }
            
        }
    }
    return answer
}
