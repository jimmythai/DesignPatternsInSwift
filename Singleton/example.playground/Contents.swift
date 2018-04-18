// Category: Creational
// When to use: In case you want to guarantee that only one instance of a object is instantiated and have global access to it.

// Define
class BackpackerManager {
    static let shared = BackpackerManager()
    
    var name = "Michael"
    
    private init() {}
}

// Use
let backpackerManger = BackpackerManager.shared
backpackerManger.name
