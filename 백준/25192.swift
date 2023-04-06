import Foundation

let input = Int(readLine()!)!
var chatArr:[String] = []
var answer = 0

for _ in 1...input{ chatArr.append(readLine()!) }

var userSet:Set<String> = []
for chat in chatArr {
    if chat == "ENTER"{
        answer += userSet.count
        userSet = []
        continue
    }else{
        userSet.insert(chat)
    }
}
answer += userSet.count
print(answer)
