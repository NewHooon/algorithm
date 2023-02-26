import Foundation

func solution(_ s:String) -> Int {
    
    var idx = 0
    var answer = 0
    var sq = s.map{String($0)}
    
    if s.count%2 != 0 { return answer}
    
    while idx < s.count{
        var stack:[String] = []
        for i in idx..<sq.count{
            var word = sq[i]
            if stack.isEmpty {
                stack.append(word)
            }else{
                if stack.last! == "[" && word == "]" {
                    stack.removeLast()
                }else if stack.last! == "{" && word == "}"{
                    stack.removeLast()
                }else if stack.last! == "(" && word == ")"{
                    stack.removeLast()
                }else{
                    stack.append(word)
                }
            }
        }
        if stack.isEmpty { answer += 1}
        sq.append(sq[idx])
        idx += 1
    }
    
    
    return answer
}
