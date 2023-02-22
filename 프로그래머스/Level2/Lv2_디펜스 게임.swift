import Foundation

final class Heap<T:Comparable> {
    var heap:[T] = []
    private let sortFuction: (T , T) -> Bool
    
    var isEmpty:Bool{ return heap.isEmpty}
    
    init(_ sortFuction: @escaping (T,T) -> Bool ){
        self.sortFuction = sortFuction
    }
    
    func push(_ data: T){
        heap.append(data)
        var newIdx = heap.count - 1
        var parentIdx = (newIdx-1)/2
        while newIdx > 0 && sortFuction(heap[newIdx], heap[parentIdx]){
            heap.swapAt(newIdx, parentIdx)
            newIdx = parentIdx
            parentIdx = (newIdx-1)/2
        }
    }
    
    func pop() -> T {
        heap.swapAt(0, heap.count - 1)
        let value = heap.removeLast()
        var nowIdx = 0
        var highIdx = nowIdx
        repeat {
            nowIdx = highIdx
            let leftIdx = nowIdx * 2 + 1
            let rightIdx = leftIdx + 1
            if leftIdx < heap.endIndex && sortFuction(heap[leftIdx], heap[highIdx]){
                highIdx = leftIdx
            }
            if rightIdx < heap.endIndex && sortFuction(heap[rightIdx], heap[highIdx]){
                highIdx = rightIdx
            }
            heap.swapAt(highIdx,nowIdx)
        } while nowIdx != highIdx
        
        return value
    }
}

func solution(_ n:Int, _ k:Int, _ enemy:[Int]) -> Int {
    
    var cN = n
    var cK = k
    var stage = 0
    var pq = Heap<Int>{ $0 > $1}
    
    for (idx, e) in enemy.enumerated() {
        pq.push(e)
        if cN >= e {
            cN -= e
        } else if cK > 0 {
            cN += pq.pop()
            cN -= e
            cK -= 1
        }else{
            break
        }
        stage = idx + 1
       
    }

    return stage
}
