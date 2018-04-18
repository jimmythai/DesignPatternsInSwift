// Category: Behavioral
// When to use: In case you want to decide algorithm at run-time.

// Define
protocol VehicleStrategy {
    func run()
}

class Vehicle {
    private let vehicle: VehicleStrategy
    
    init(_ vehicle: VehicleStrategy) {
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

// Use
let car = Car()
let bike = Bike()

let vehicle = Vehicle(car)
vehicle.run()
