import Foundation

class Queue<T>{
    private var enqueue:[T] = []
    private var dequeue:[T] = []
    var isEmpty:Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    var size:Int{
        return enqueue.count + dequeue.count
    }
    
    func push(_ item: T){
        enqueue.append(item)
    }
    
    func pop() -> T {
        if dequeue.isEmpty{
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()!
    }
}

var queue = Queue<Int>()
var size = Int(readLine()!)!
while(true){
    let packet = Int(readLine()!)!
    if packet == -1 {break}
    else if packet == 0 && !queue.isEmpty{ queue.pop() }
    else if packet > 0 && queue.size < size {
        queue.push(packet)
    }
}

while(!queue.isEmpty)
{
    print(queue.pop())
}


