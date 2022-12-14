import Foundation

func solution(_ s:String) -> Int {

    var count = 0, answer = 0
    var wordStack:[Character] = []

    for word in s  {
        if wordStack.isEmpty{
            wordStack.append(word)
            count += 1
        }else{
            if wordStack.last! == word{
                count += 1
            } else{
                count -= 1
            }
            if count == 0{
                wordStack = []
                answer += 1
            }
        }
    }
    return wordStack.isEmpty ? answer : answer + 1
}
