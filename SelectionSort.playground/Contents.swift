/// Sorts an array using 'Selection sort' algorithm. Changes the input array.
///
/// Selection sort:
///
/// 1. Find smallest (ascending order) or tallest (descending order) element.
/// 2. Swap it with leftmost unsorted element.
/// 3. Move sublist boundaries by one element to the right.
///
/// Using:
///
///     var array = [9, 8, 1, 7, 5, 9, 4, 8, 5, 4]
///     sortBySelectionSort(&array)
///
/// - Parameter array: The input array that needs to be sorted.
///
/// - Complexity: O(n^2)

func sortBySelectionSort<Element>(_ array: inout [Element]) where Element: Comparable {
    for index in 0 ..< array.count {
        var minIndex = index
        
        for currentIndex in index + 1 ..< array.count {
            if array[minIndex] > array[currentIndex] {
                minIndex = currentIndex
            }
        }
        
        let temp = array[minIndex]
        array[minIndex] = array[index]
        array[index] = temp
    }
}

/// Example 1

var arrayInts = [8, 11, 14, 5, 15, 1, 7, 4, 11, 8, 3, 5, 12, 2, 9, 4, 5, 9, 3, 19]
sortBySelectionSort(&arrayInts)
print("Sorted array of integers:", arrayInts)

/// Example 2

var arrayStrings = ["Alice", "Walter", "Rupert", "Chuck", "Judy", "Frank", "Bob", "Olivia"]
sortBySelectionSort(&arrayStrings)
print(arrayStrings)
