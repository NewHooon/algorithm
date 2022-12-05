import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var gameWordStack:[String] = []
    for (idx, word) in words.enumerated(){
        if gameWordStack.isEmpty {
            gameWordStack.append(word)
        } else {
            if gameWordStack.last!.last! == word.first! && !gameWordStack.contains(word){
                gameWordStack.append(word)
            }else{
                return [ idx % n + 1, (idx / n) + 1]
            }
        }
    }
    
    return [0,0]
}
