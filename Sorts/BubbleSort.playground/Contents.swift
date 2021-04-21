/// Sorts an array using 'Bubble sort' algorithm
///
/// Bubble sort:
///
/// 1. Compares the first two elements and swap them if the first element less than the second one
/// 2. Go to next pair of elements and repeat step 1 with this pair until the end of array
/// 3. Repeat steps 1 and 2 until the array is sorted
///
/// - Complexity: O(n^2)

extension Array where Element: Comparable {
    
    typealias Completion = (Element, Element) -> Bool
    
    mutating func bubbleSort(by areInIncreasingOrder: Completion) {
        bubbleSort(array: &self, areInIncreasingOrder: areInIncreasingOrder)
    }
    
    func bubbleSorted(by areInIncreasingOrder: Completion) -> [Element] {
        var resultArray: [Element] = self
        bubbleSort(array: &resultArray, areInIncreasingOrder: areInIncreasingOrder)
        return resultArray
    }
    
    private func bubbleSort(array: inout [Element], areInIncreasingOrder: Completion) {
        guard !array.isEmpty else {
            return
        }
        
        for _ in 1 ..< array.count {
            for bubble in 1 ..< array.count {
                if areInIncreasingOrder(array[bubble], array[bubble - 1]) {
                    array.swapAt(bubble, bubble - 1)
                }
            }
        }
    }
}

/// Example 1
var emptyArray: [Int] = []
emptyArray.bubbleSort(by: <)
print("Sorted emptyArray:", emptyArray)
/// Prints:
///     []

/// Example 2
var numbersAsc = [37, 40, 21, 15, 11, 9, 79, 71, 83, 80, 69, 66, 97, 64, 29, 45, 53, 73, 31, 32, 74, 65, 16]
numbersAsc.bubbleSort(by: <)
print("Sorted array of numbers in ascending order:", numbersAsc)
// OR
//  let numbersAscSorted = numbersAsc.bubbleSorted(by: <)
//  print("Sorted array of numbers in ascending order:", numbersAscSorted)

/// Prints:
///     [9, 11, 15, 16, 21, 29, 31, 32, 37, 40, 45, 53, 64, 65, 66, 69, 71, 73, 74, 79, 80, 83, 97]

/// Example 3
var stringsDesc = ["H", "e", "l", "l", "o", ",", " ", "W", "o", "r", "l", "d", "!"]
stringsDesc.bubbleSort(by: >)
print("Sorted array of strings in descending order:", stringsDesc)
// OR
//  let stringsDescSorted = stringsDesc.bubbleSorted(by: >)
//  print("Sorted array of strings in descending order:", stringsDescSorted)

/// Prints:
///     ["r", "o", "o", "l", "l", "l", "e", "d", "W", "H", ",", "!", " "]
