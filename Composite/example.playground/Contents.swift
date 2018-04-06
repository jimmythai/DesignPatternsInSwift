import Foundation
import UIKit

// Example 1
protocol Box {
    var price: Int { get set }
    
    func open()
}

struct SquareBox: Box {
    var price = 10
    
    func open() {
        print("Open a square box")
    }
}

struct CylinderBox: Box {
    var price = 20
    
    func open() {
        print("Open a cylinder box")
    }
}

struct Present: Box {
    var price: Int {
        get {
            return boxes.reduce(0) { $0 + $1.price }
        }
        set {}
    }
    var boxes: [Box]
    
    func open() {
        print("Open a present")
    }
}

let cylinderBox1 = CylinderBox()
let cylinderBox2 = CylinderBox()
let squareBox1 = SquareBox()
let squareBox2 = SquareBox()
let squareBox3 = SquareBox()

let smallPresent = Present(boxes: [squareBox3])
let bigPresent = Present(boxes: [smallPresent, cylinderBox1, squareBox2])
let christmasPresent = Present(boxes: [bigPresent, cylinderBox2, squareBox1])

print(christmasPresent.price)

// Example 2
protocol Team {
    var children: [Team] { get set }
    var people: [String] { get set }

    func countNumberOfPeople() -> Int
}

struct Department: Team {
    var children: [Team]
    var people: [String]
    
    func countNumberOfPeople() -> Int {
        let numberOfPeopleInChildren = children.reduce(0) { $0 + $1.countNumberOfPeople() }
        return numberOfPeopleInChildren + people.count
    }
}

let department1 = Department(children: [], people: ["Claptone", "Adam"])
let department2 = Department(children: [department1], people: ["Michael"])
let department3 = Department(children: [], people: ["Jason"])
let company = Department(children: [department2, department3], people: ["Amelie", "Rachael"])

print("There are \(company.countNumberOfPeople()) employees in the company.")
