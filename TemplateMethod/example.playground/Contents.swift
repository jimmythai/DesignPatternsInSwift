// Category: Behavioral
// When to use: In case you want to make the skelton of an algorithm and decide it at run-time.

// Pattern 1
// - You need to write empty functions.
// - But, you don't know that you override the methods which you have to or not until you run the application.
class AbstractClass {
    final func operation() {
        subOperation1()
        subOperation2()
    }
    
    func subOperation1() {
        fatalError("Override this method.")
    }
    func subOperation2() {
        fatalError("Override this method.")
    }
}

class ConcreteClass: AbstractClass {
    override func subOperation1() {
        print("sub operation 1")
    }
    override func subOperation2() {
        print("sub operation 2")
    }
}

let concreteClass = ConcreteClass()
concreteClass.operation()


// Pattern 2
// - Since Swift doesn't have abstract class, this will better.
// - However, it is possible for you to override the `operation()` method.
protocol OperationProtocol {
    func subOperation1()
    func subOperation2()
}

extension OperationProtocol {
    func operation() {
        subOperation1()
        subOperation2()
    }
}

struct ConcreteStruct: OperationProtocol {
    func subOperation1() {
        print("sub operation 1")
    }

    func subOperation2() {
        print("sub operation 2")
    }
}
let concreteStruct = ConcreteStruct()
concreteStruct.operation()


// Pattern 3
// Not to override `operation()` method, use delegation pattern.
protocol FinalOperationProtocol {
    func operation()
}

protocol OperationsProtocol {
    func subOperation1()
    func subOperation2()
}

class FinalOperation: FinalOperationProtocol {
    private let delegate: OperationsProtocol
    
    init(delegate: OperationsProtocol) {
        self.delegate = delegate
    }
    
    func operation() {
        delegate.subOperation1()
        delegate.subOperation2()
    }
}

class SomeOperations1: OperationsProtocol {
    func subOperation1() {
        print("sub operation 1")
    }
    
    func subOperation2() {
        print("sub operation 2")
    }
}

let finalOperation = FinalOperation(delegate: SomeOperations1())
finalOperation.operation()

// The purpose of Strategy pattern and Template Method pattern are to make the detail of alogrithms changeable.
