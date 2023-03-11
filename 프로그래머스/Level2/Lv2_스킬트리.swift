import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    for skillTree in skill_trees{
        var skillString:[String] = []
        var valid = true
        let skillBook = skill.map{String($0)}
        let skillArr = skillTree.map{String($0)}
        for word in skillArr {
            if skill.contains(word){ skillString.append(word) }
        }
        for idx in 0..<skillString.count{
            if skillBook[idx] != skillString[idx]{
                valid = false
                break
            }
        }
        if valid { answer += 1 }
    }
    
    return answer
}
