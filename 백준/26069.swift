import Foundation

let input = Int(readLine()!)!

var userSet:Set<String> = ["ChongChong"]

for _ in 1...input{
    let person = readLine()!.split(separator: " ").map{String($0)}
    if userSet.contains(person[0]) || userSet.contains(person[1]){
        userSet.insert(person[0])
        userSet.insert(person[1])
    }
}
print(userSet.count)

