import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    
    var totalSI:[Int] = []
    var answer = 0
    
    var sortedData = data.sorted{
        if $0[col-1] == $1[col-1]{
            return $0[0] > $1[0]
        }else{
            return $0[col-1] < $1[col-1]
        }
    }
    
    for rowIndex in (row_begin-1)...(row_end-1){
        var sum = 0
        for columnIndex in 0..<sortedData[0].count{
            sum = sum + sortedData[rowIndex][columnIndex] % (rowIndex+1)
        }
        totalSI.append(sum)
    }
    
    for index in 0..<totalSI.count{
        if index == 0{
            answer = totalSI[0]
        }else{
            answer ^= totalSI[index]
        }
    }
    
    return answer
}
