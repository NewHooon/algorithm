import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    var result = ""
    let alphaArr = "abcdefghijklmnopqrstuvwxyz".map{String($0)}
    let sArr = s.map{String($0)}
    let skipArr = skip.map{String($0)}
    for word in sArr{
        var skipIndex = index
        var currentIndex = alphaArr.firstIndex(of: word)!
        while skipIndex != 0 {
            let nextWord = alphaArr[(currentIndex+1)%26]
            if  !skipArr.contains(nextWord){
                skipIndex -= 1
                currentIndex += 1
            }else {
                currentIndex += 1
            }
        }
         result += alphaArr[currentIndex%26]
    }
    return result
}
