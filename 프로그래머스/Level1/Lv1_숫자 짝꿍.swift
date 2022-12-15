import Foundation

func solution(_ X:String, _ Y:String) -> String {
  var xNumberArr:[Int] = Array(repeating:0, count: 10)
  var yNumberArr:[Int] = Array(repeating:0, count: 10)
  X.map{String($0)}.forEach{xNumberArr[Int($0)!] += 1}
  Y.map{String($0)}.forEach{yNumberArr[Int($0)!] += 1}
                   
  var idx = 9
  var answerString = ""
  while idx >= 0 {
      var numberCount = min(xNumberArr[idx], yNumberArr[idx])
      for _ in 0..<numberCount{ answerString += String(idx) }
      idx -= 1
  }
    if answerString.isEmpty {return "-1"}
    else if answerString.first! == "0" { return "0"}
    else{ return answerString }
}
