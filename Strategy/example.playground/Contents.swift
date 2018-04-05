protocol VehicleStrategy {
    func run()
}

class Vehicle {
    private let vehicle: VehicleStrategy
    
    init(vehicle: VehicleStrategy) {
        self.vehicle = vehicle
    }
    
    func run() {
        vehicle.run()
    }
}

class Car: VehicleStrategy {
    func run() {
        print("A car is running.")
    }
}

class Bike: VehicleStrategy {
    func run() {
        print("A bike is running.")
    }
}

let car = Car()
let bike = Bike()

let vehicle = Vehicle(vehicle: car)
vehicle.run()
