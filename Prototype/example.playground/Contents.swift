// Category: Creational
// When to use: In case you want to create new objects by copying existing one.

import Foundation

// Pattern 1
// Define
class Person {
    var name: String?
    let age: Int?
    let nationality: String?
    
    init(name: String?, age: Int?, nationality: String?) {
        self.name = name
        self.age = age
        self.nationality = nationality
    }
    
    func clone() -> Person {
        return Person(name: name, age: age, nationality: nationality)
    }
}

// Use
let person = Person(name: "Jimmy Thai", age: 18, nationality: "Japan")
print(person.name)

let copiedPerson = person.clone()
print(copiedPerson.name)


// Pattern 2
// Define
class Person2: NSCopying {
    var name: String?
    let age: Int?
    let nationality: String?
    
    init(name: String?, age: Int?, nationality: String?) {
        self.name = name
        self.age = age
        self.nationality = nationality
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return Person2(name: name, age: age, nationality: nationality)
    }
}

// Use
let person2 = Person2(name: "Michael", age: 22, nationality: "France")
print(person2.name)

let copiedPerson2 = person2.copy() as! Person2
print(copiedPerson2.name)
