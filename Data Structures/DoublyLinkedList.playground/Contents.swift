import XCTest

struct SinglyLinkedList<T>: Sequence {
    
    var head: SinglyLinkedListNode<T>
    
    init(head: SinglyLinkedListNode<T>) {
        self.head = head
    }
    
    func makeIterator() -> SinglyLinkedListIterator<T> {
        return SinglyLinkedListIterator(currentElement: head)
    }
}

indirect enum SinglyLinkedListNode<T> {
    case value(element: T, next: SinglyLinkedListNode<T>)
    case end
}

struct SinglyLinkedListIterator<T>: IteratorProtocol {
    
    var currentElement: SinglyLinkedListNode<T>
    
    mutating func next() -> T? {
        switch currentElement {
        case let .value(element, next):
            currentElement = next
            return element
        case .end:
            return nil
        }
    }
}

let element7 = SinglyLinkedListNode.value(element: "Chapter 6. Conclusion", next: .end)
let element6 = SinglyLinkedListNode.value(element: "Chapter 5. Behavioral patterns", next: element7)
let element5 = SinglyLinkedListNode.value(element: "Chapter 4. Structural patterns", next: element6)
let element4 = SinglyLinkedListNode.value(element: "Chapter 3. Creational patterns", next: element5)
let element3 = SinglyLinkedListNode.value(element: "Chapter 2. Designing a document editor", next: element4)
let element2 = SinglyLinkedListNode.value(element: "Chapter 1. An introduction to design patterns", next: element3)
let element1 = SinglyLinkedListNode.value(element: "Preface", next: element2)
let singlyLinkedList = SinglyLinkedList(head: element1)

singlyLinkedList.enumerated().forEach({
    print("Element #\($0.0), value:", $0.1)
})

/// Prints:
///     Element #0, value: Preface
///     Element #1, value: Chapter 1. An introduction to design patterns
///     Element #2, value: Chapter 2. Designing a document editor
///     Element #3, value: Chapter 3. Creational patterns
///     Element #4, value: Chapter 4. Structural patterns
///     Element #5, value: Chapter 5. Behavioral patterns
///     Element #6, value: Chapter 6. Conclusion
