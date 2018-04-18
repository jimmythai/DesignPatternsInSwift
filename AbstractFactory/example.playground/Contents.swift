// Category: Creational
// When to use: In case you want to decouple an object creation of 'family' from its implementations and increase the flexibility.

// Abstract Factory
protocol ElectronicCompany {
    func createTV() -> TV
    func createWashingMachine() -> WashingMachine
}

// Abstract Product
protocol TV {
    var name: String { get }
}

protocol WashingMachine {
    var name: String { get }
}

// Concrete Product
struct PanasonicTV: TV {
    var name {
        return "VIERA"
    }
}

struct PanasonicWashingMachine: WashingMachine {
    var name: String {
        return "Panasonic Washing Machine"
    }
}

struct ToshibaTV: TV {
    var name: String {
        return "REGZA"
    }
}

struct ToshibaWashingMachine: WashingMachine {
    var name: String {
        return "Toshiba Washing Machine"
    }
}

// Concrete Factory
struct Sony: ElectronicCompany {
    func createTV() -> TV {
        return PanasonicTV()
    }
    
    func createWashingMachine() -> WashingMachine {
        return PanasonicWashingMachine()
    }
}

struct Toshiba: ElectronicCompany {
    func createTV() -> TV {
        return ToshibaTV()
    }
    
    func createWashingMachine() -> WashingMachine {
        return ToshibaWashingMachine()
    }
}

let sony = Sony()
sony.createTV()
sony.createWashingMachine()

let toshiba = Toshiba()
toshiba.createTV()
toshiba.createWashingMachine()
