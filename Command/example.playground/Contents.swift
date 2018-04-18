// Category: Behavioral
// When to use: In case you want to make a request a object.

// Define
protocol Command {
    func execute()
}

struct PotatoChips {
    let name: String
    
    func open() {
        print("\(name) opened")
    }
}

struct OrangeJuice {
    let name: String
    
    func shake() {
        print("\(name) shaked")
    }
    
    func open() {
        print("\(name) opened")
    }
}

struct PotatoChipsOpenCommand: Command {
    let potatoChips: PotatoChips
    
    func execute() {
        potatoChips.open()
    }
}

struct OrangeJuiceOpenCommand: Command {
    let orangeJuice: OrangeJuice
    
    func execute() {
        orangeJuice.shake()
        orangeJuice.open()
    }
}

struct PartyOwner {
    private var commands = [Command]()
    
    mutating func push(command: Command) {
        commands.append(command)
    }
    
    func prepareForParty() {
        commands.forEach { $0.execute() }
        
        print("Well, it's ready:)")
    }
}

// Use
let potatoChips = PotatoChips(name: "Tasty potato chips")
let orangeJuice = OrangeJuice(name: "Valencia orange juice")

var partyOwner = PartyOwner()
partyOwner.push(command: PotatoChipsOpenCommand(potatoChips: potatoChips))
partyOwner.push(command: OrangeJuiceOpenCommand(orangeJuice: orangeJuice))
partyOwner.prepareForParty()
