import Foundation
/*
 트럭 역시.. 1종 대형이라 그런지 다리건너기 너무어렵다...ㅜㅜ
 
 */
class Queue<T>{
    private var enQueue:[T] = []
    private var deQueue: [T] = []
    var isEmpty:Bool { return enQueue.isEmpty && deQueue.isEmpty }
    func push(_ item: T){ enQueue.append(item) }
    func pop() -> T {
        if deQueue.isEmpty{
            deQueue = enQueue.reversed()
            enQueue.removeAll()
        }
        return deQueue.popLast()!
    }
    var first:T{
        if deQueue.isEmpty{
               return enQueue[0]
        }else{
            return deQueue.last!
        }
    }
}

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var roadQ = Queue<(Int,Int)>()
    var tIdx = 0, time = 0, roadWeight = 0

    while !roadQ.isEmpty || tIdx < truck_weights.count {
        time += 1
        if roadQ.isEmpty{
                roadQ.push((truck_weights[tIdx], time))
                roadWeight += truck_weights[tIdx]
                tIdx += 1
        }else{
            if (time - roadQ.first.1) ==  bridge_length { roadWeight -= roadQ.pop().0 }

            if tIdx < truck_weights.count  && (roadWeight + truck_weights[tIdx]) <= weight {
                roadQ.push((truck_weights[tIdx], time))
                roadWeight += truck_weights[tIdx]
                tIdx += 1
            }
        }
    }
    return time
}
