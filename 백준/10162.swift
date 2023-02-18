import Foundation

let timer = [300, 60, 10]
var time = Int(readLine()!)!
var button = [0,0,0]
for index in 0..<timer.count{
    button[index] += (time / timer[index])
    time = time % timer[index]
}

if time == 0{
    button.forEach{print($0, terminator: " ")}
} else{
    print(-1)
}
