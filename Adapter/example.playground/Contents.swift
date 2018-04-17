// Category: Structural
// When to use: In case you need a different interface without changing an existent class/struct

// Object adapter
// Define
protocol Thunderbold3 {
    func display()
}

class Thunderbolt3ToThunderbold2Adapter: Thunderbold3 {
    var thunderbolt2: Thunderbolt2
    
    init(thunderbolt2: Thunderbolt2) {
        self.thunderbolt2 = thunderbolt2
    }
    
    func display() {
        thunderbolt2.oldDisplay()
    }
}

class Thunderbolt2 {
    func oldDisplay() {
        print("old display")
    }
}

// Use
let thunderbolt2 = Thunderbolt2()
let thunderbolt3 = Thunderbolt3ToThunderbold2Adapter(thunderbolt2: thunderbolt2)
thunderbolt3.display()

// Class adapter
// Define
protocol Thunderbolt3c {
    func display()
}

class Thunderbolt2c {
    func oldDisplay() {
        print("old display")
    }
}

class Thunderbolt3ToThunderbold2Adapterc: Thunderbolt2c, Thunderbolt3c {
    func display() {
        oldDisplay()
    }
}

// Use
let thunderbolt3c = Thunderbolt3ToThunderbold2Adapterc()
thunderbolt3c.display()
