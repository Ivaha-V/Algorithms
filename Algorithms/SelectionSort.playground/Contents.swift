/// Sorts an array using 'Selection sort' algorithm. Changes the input array.
///
/// Selection sort:
///
/// 1. Find smallest (ascending order) or tallest (descending order) element.
/// 2. Swap it with leftmost unsorted element.
/// 3. Move sublist boundaries by one element to the right.
///
/// - Complexity: O(n^2)

extension Array where Element: Comparable {
    
    typealias Completion = (Element, Element) -> Bool
    
    mutating func selectionSort(by areInIncreasingOrder: Completion) {
        selectionSort(array: &self, areInIncreasingOrder: areInIncreasingOrder)
    }
    
    func selectionSorted(by areInIncreasingOrder: Completion) -> [Element] {
        var resultArray: [Element] = self
        selectionSort(array: &resultArray, areInIncreasingOrder: areInIncreasingOrder)
        return resultArray
    }
    
    private func selectionSort(array: inout [Element], areInIncreasingOrder: Completion) {
        guard !array.isEmpty else {
            return
        }
        
        for index in 0 ..< array.count {
            var minIndex = index
            
            for currentIndex in index + 1 ..< array.count {
                if !areInIncreasingOrder(array[minIndex], array[currentIndex]) {
                    minIndex = currentIndex
                }
            }
            
            let temp = array[minIndex]
            array[minIndex] = array[index]
            array[index] = temp
        }
    }
}

/// Example 1
var emptyArray: [Int] = []
emptyArray.selectionSort(by: <)
print("Sorted emptyArray:", emptyArray)
/// Prints:
///     []

/// Example 2
var numbersAsc = [37, 40, 21, 15, 11, 9, 79, 71, 83, 80, 69, 66, 97, 64, 29, 45, 53, 73, 31, 32, 74, 65, 16]
numbersAsc.selectionSort(by: <)
print("Sorted array of numbers in ascending order:", numbersAsc)
// OR
//  let numbersAscSorted = numbersAsc.selectionSorted(by: <)
//  print("Sorted array of numbers in ascending order:", numbersAscSorted)

/// Prints:
///     [9, 11, 15, 16, 21, 29, 31, 32, 37, 40, 45, 53, 64, 65, 66, 69, 71, 73, 74, 79, 80, 83, 97]

/// Example 3
var stringsDesc = ["H", "e", "l", "l", "o", ",", " ", "W", "o", "r", "l", "d", "!"]
stringsDesc.selectionSort(by: >)
print("Sorted array of strings in descending order:", stringsDesc)
// OR
//  let stringsDescSorted = stringsDesc.selectionSorted(by: >)
//  print("Sorted array of strings in descending order:", stringsDescSorted)

/// Prints:
///     ["r", "o", "o", "l", "l", "l", "e", "d", "W", "H", ",", "!", " "]
