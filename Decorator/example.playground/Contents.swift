// Category: Structural
// When to use: In case you want to add new behaviors to objects by regarding them as wrapper objects.

// Define
// Core Component
protocol iPhone {
    var cost: Double { get }
    var name: String { get }
}

// Concrete Component
struct iPhone6: iPhone {
    var cost: Double {
         return 100
    }
    var name: String {
        return "iPhone 6"
    }
}

// Decorator
protocol iPhoneDecorator: iPhone {
    var base: iPhone { get }
}

// Concrete Decorator
class iPhone6Plus: iPhone {
    var cost: Double {
        return 120
    }
    var name: String {
        return "iPhone 6 Plus"
    }
}

struct UpgradeStorage: iPhoneDecorator {
    let base: iPhone
    
    var cost: Double {
        return base.cost + 20
    }
    var name: String {
        return "\(base.name) with bigger storage"
    }
}

struct BlackColor: iPhoneDecorator {
    let base: iPhone
    
    var cost: Double {
        return base.cost
    }
    var name: String {
        return "Black \(base.name)"
    }
}

struct GoldColor: iPhoneDecorator {
    let base: iPhone
    
    var cost: Double {
        return base.cost
    }
    var name: String {
        return "Gold \(base.name)"
    }
}

// Use
let iphone6 = iPhone6()
let biggeriPhone = UpgradeStorage(base: iphone6)
let goldColoriPhone = GoldColor(base: biggeriPhone)

print(goldColoriPhone.name)


