import XCTest

struct Stack<T> {
    
    private var values: [T] = []
    
    var isEmpty: Bool {
        return values.isEmpty
    }
    
    var topValue: T? {
        return values.first
    }
    
    mutating func push(_ value: T) {
        values.append(value)
    }
    
    mutating func pop() -> T? {
        return values.popLast()
    }
}

class StackTests: XCTestCase {
    
    var stackMock: Stack<Int>!
    
    override func setUp() {
        super.setUp()
        stackMock = Stack<Int>()
    }
    
    override func tearDown() {
        super.tearDown()
        stackMock = nil
    }
    
    func testStackIsNotEmptyAfterPush() {
        // Given
        let value = 2
        
        // When
        stackMock.push(value)
        
        // Then
        XCTAssertFalse(stackMock.isEmpty, "Stack is empty")
    }
    
    func testStackHasPushedValueAtTop() {
        // Given
        let value = 4
        
        // When
        stackMock.push(value)
        
        // Then
        XCTAssertEqual(stackMock.topValue, value, "Stack doesn't have pushed value at top")
    }
    
    func testStackDoesNotHaveValueAfterPop() {
        // Given
        let value = 2
        var poppedValue: Int?
        
        stackMock.push(value)
        
        // When
        poppedValue = stackMock.pop()
        
        // Then
        XCTAssertNotNil(poppedValue, "Stack has value after pop")
    }
}

StackTests.defaultTestSuite.run()
