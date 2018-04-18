// Category: Behavioral
// When to use: In case you have more than one object where you have to notify the changes of an object.

// Define
protocol Observer {
    var id: Int { get }
    func update<T>(with newValue: T)
}

protocol Observable {
    associatedtype T
    var value: T { get set }
    var observers: [Observer] { get set }
    
    func addObserver(observer: Observer)
    func removeObserver(observer: Observer)
    func notifyAllObservers<T>(with newValue: T)
}

class Variable<T>: Observable {
    var value: T {
        get {
            return _value
        }
        set {
            _value = newValue
            notifyAllObservers(with: newValue)
        }
    }
    var observers: [Observer] {
        get {
            return _observers
        }
        set {
            _observers = newValue
        }
    }
    
    private var _value: T!
    private var _observers = [Observer]()
    
    init(_ value: T) {
        _value = value
    }
    
    func addObserver(observer: Observer) {
        observers.append(observer)
    }
    
    func removeObserver(observer: Observer) {
        observers = observers.filter { $0.id == observer.id }
    }
    
    func notifyAllObservers<T>(with newValue: T) {
        observers.forEach { $0.update(with: newValue) }
    }
}

class SomeObserver: Observer {
    var id: Int {
        get {
            return _id
        }
    }
    
    private var _id = 0
    
    init(id: Int) {
        self._id = id
    }
    
    func update<T>(with newValue: T) {
        print("\(id) is updated with \(newValue)")
    }
}

// Use
let observer1 = SomeObserver(id: 1)
let observer2 = SomeObserver(id: 2)
let name1 = Variable("Michael")

name1.addObserver(observer: observer1)
name1.addObserver(observer: observer2)

name1.value = "Jason"
