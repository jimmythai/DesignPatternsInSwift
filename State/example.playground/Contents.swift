// Category: Behavioral
// When to use: In case you want to have behaviors which change depending on their states.

import UIKit

// Define
protocol HealthState {
    var color: UIColor { get }
    var face: String { get }
}

class Good: HealthState {
    var color = UIColor.green
    var face = "😄"
}

class Soso: HealthState {
    var color = UIColor.yellow
    var face = "😑"
}

class Bad: HealthState {
    var color = UIColor.red
    var face = "😱"
}

class Student {
    private var state: HealthState = Good()
    
    var healthColor: UIColor {
        return state.color
    }
    
    var face: String {
        return state.face
    }
    
    func change(health: HealthState) {
        state = health
    }
}

// Use
let someStudent = Student()
print("Face: \(someStudent.face)")

someStudent.change(health: Bad())
print("Face: \(someStudent.face)")
