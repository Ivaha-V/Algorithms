/// Sorts an array using 'Insertion sort' algorithm
///
/// Insertion sort:
///
/// 1. Iterate from array[1] to array[n - 1] over the array.
/// 2. Compare the current element to its predecessor.
/// 3. If the current element is smaller than its predecessor, compare it to the elements before. Move the greater elements one position up to make space for the swapped element.
///
/// - Complexity: O(n^2)

extension Array where Element: Comparable {
    
    typealias Completion = (Element, Element) -> Bool
    
    mutating func insertionSort(by areInIncreasingOrder: Completion) {
        insertionSort(array: &self, areInIncreasingOrder: areInIncreasingOrder)
    }
    
    func insertionSorted(by areInIncreasingOrder: Completion) -> [Element] {
        var resultArray: [Element] = self
        insertionSort(array: &resultArray, areInIncreasingOrder: areInIncreasingOrder)
        return resultArray
    }
    
    private func insertionSort(array: inout [Element], areInIncreasingOrder: Completion) {
        guard !array.isEmpty else {
            return
        }
        
        for index in 1 ..< array.count {
            var j = index
            while j > 0 && !areInIncreasingOrder(array[j - 1], array[j]) {
                array.swapAt(j - 1, j)
                j -= 1
            }
        }
    }
}

/// Example 1
var emptyArray: [Int] = []
emptyArray.insertionSort(by: <)
print("Sorted emptyArray:", emptyArray)
/// Prints:
///     []

/// Example 2
var numbersAsc = [37, 40, 21, 15, 11, 9, 79, 71, 83, 80, 69, 66, 97, 64, 29, 45, 53, 73, 31, 32, 74, 65, 16]
numbersAsc.insertionSort(by: <)
print("Sorted array of numbers in ascending order:", numbersAsc)
// OR
//  let numbersAscSorted = numbersAsc.insertionSorted(by: <)
//  print("Sorted array of numbers in ascending order:", numbersAscSorted)

/// Prints:
///     [9, 11, 15, 16, 21, 29, 31, 32, 37, 40, 45, 53, 64, 65, 66, 69, 71, 73, 74, 79, 80, 83, 97]

/// Example 3
var stringsDesc = ["H", "e", "l", "l", "o", ",", " ", "W", "o", "r", "l", "d", "!"]
stringsDesc.insertionSort(by: >)
print("Sorted array of strings in descending order:", stringsDesc)
// OR
//  let stringsDescSorted = stringsDesc.insertionSorted(by: >)
//  print("Sorted array of strings in descending order:", stringsDescSorted)

/// Prints:
///     ["r", "o", "o", "l", "l", "l", "e", "d", "W", "H", ",", "!", " "]
