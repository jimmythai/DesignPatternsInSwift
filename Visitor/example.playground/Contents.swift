protocol Animal {
    var name: String { get }
    
    func behave(_ behavior: Behavior)
}

protocol Behavior {
    func start(_ animal: Cat)
    func start(_ animal: Dog)
}

class Cat: Animal {
    var name = "cat"
    
    func behave(_ behavior: Behavior) {
        behavior.start(self)
    }
}

class Dog: Animal {
    var name = "dog"
    
    func behave(_ behavior: Behavior) {
        behavior.start(self)
    }
}

class MoveBehavior: Behavior {
    func start(_ animal: Cat) {
        print("\(animal.name) is running away.")
    }
    
    func start(_ animal: Dog) {
        print("\(animal.name) is fetching a ball.")
    }
}

class BarkBehavior: Behavior {
    func start(_ animal: Cat) {
        print("meow")
    }
    
    func start(_ animal: Dog) {
        print("wuff")
    }
}

let move = MoveBehavior()
let bark = BarkBehavior()
let animals: [Animal] = [Cat(), Dog()]

animals.forEach {
    $0.behave(move)
    $0.behave(bark)
}

// In case that the number of data class doesn't change and the behavior can increase, the Visitor pattern is really usefull.
