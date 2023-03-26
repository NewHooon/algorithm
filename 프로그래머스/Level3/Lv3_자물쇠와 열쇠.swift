import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var answer = false
    var rotationKey = key
    var keySize = key[0].count
    var lockSize = lock[0].count
    
    func rotation(){
        var temp = rotationKey
        for row in key.indices {
            for col in key.indices{
                rotationKey[col][keySize-1-row] = temp[row][col]
            }
        }
    }
    
    func isAnswer(_ lockResult:[[Int]]) -> Bool{
        for row in lockResult.indices{
            for col in lockResult.indices{
                if lockResult[row][col] == 0 || lockResult[row][col] == 2{
                    return false
                }
            }
        }
        return true
    }
    
    func isUnlock() -> Bool {
        var lockResult = lock
        for rx in 0...2*lockSize{
            for ry in 0...2*lockSize{
                for lx in 0..<lockSize{
                    for ly in 0..<lockSize{
                        let nx = (keySize - 1) + lx  - rx
                        let ny = (keySize - 1) + ly - ry
                        if (0...keySize-1) ~= nx && (0...keySize-1) ~= ny {
                           lockResult[lx][ly] = lock[lx][ly] + rotationKey[nx][ny]
                        }
                    }
                }
                if isAnswer(lockResult){
                    return true
                }else{
                    lockResult = lock
                }
            }
        }
        return false
    }
    
    for _ in 0...3{
        if isUnlock() {
            answer = true
            break
        }else{
            rotation()
        }
    }
    
    return answer
}
