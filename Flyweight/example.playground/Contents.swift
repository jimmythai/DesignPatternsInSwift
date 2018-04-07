struct Car {
    let name: String
}

class CarFactory {
    private var cars: [String: Car] = [:]
    
    func createCar(of name: String) -> Car {
        let car = Car(name: name)
        cars[name] = car
        return car
    }
    
    func getCar(of name: String) -> Car {
        if let car = cars[name] {
            return car
        } else {
            let car = createCar(of: name)
            return car
        }
    }
}

let carFactory = CarFactory()
let sedan = carFactory.getCar(of: "Sedan")
