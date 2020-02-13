import Foundation

func quickSort<T: Comparable>(_ collection:[T], _ comparator:(T, T) -> Bool) -> [T] {
    let result = quickSorHelper(collection, 0, collection.count - 1, comparator)
    return result
}

func quickSorHelper<T: Comparable>(_ arr:[T], _ start:Int, _ end:Int, _ comparator:(T, T) -> Bool) -> [T] {
    if start >= end {
        return arr
    }
    var array = arr

    // pick base element up
    var base = start

    // separate higher element and lower element
    for i in start...end {
        
        if comparator(array[i], array[base]) {
            let tmp = array[i]
            array.remove(at: i)
            array.insert(tmp, at: 0)
            base += 1
        }
    }
    
    array = quickSorHelper(array, 0, base - 1, comparator)
    array = quickSorHelper(array, base + 1, end, comparator)

    return array

}



