import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0]
let m = input[1]

var minPackage = Int.max
var minLine = Int.max
var answer = 0
for _ in 1...m{
    let guitar = readLine()!.split(separator: " ").map{Int($0)!}
    minPackage = minPackage > guitar[0] ? guitar[0] : minPackage
    minLine = minLine > guitar[1] ? guitar[1] : minLine
}

if minLine*6 < minPackage {
    answer = n * minLine
}else{
    let remain = n%6
    let compareLinePack = remain * minLine > minPackage ? minPackage : remain * minLine
    answer = minPackage * (n/6) + compareLinePack
}

print(answer)
