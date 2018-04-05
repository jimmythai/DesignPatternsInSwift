protocol Engine {
    func move()
}

class PowerfulEngine: Engine {
    func move() {
        print("Powerful engine moved.")
    }
}

class FastEngine: Engine {
    func move() {
        print("Fast engine moved.")
    }
}

protocol Vehicle {
    var engine: Engine { get set }
    
    func run()
}

class Car: Vehicle {
    var engine: Engine
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    func run() {
        engine.move()
    }
}

class Bike: Vehicle {
    var engine: Engine
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    func run() {
        engine.move()
    }
}

let powerfulEngine = PowerfulEngine()
let fastEngine = FastEngine()

let car = Car(engine: fastEngine)
let bike = Bike(engine: powerfulEngine)

car.run()
bike.run()
