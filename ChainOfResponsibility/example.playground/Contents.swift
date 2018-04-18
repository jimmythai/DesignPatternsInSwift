// Category: Behavioral
// When to use: In case you need more than one handler for the request.

struct Person {
    let name: String
    let waist: Int
}

struct Cloth {
    let name: String
    let price: Int
}

protocol Closet {
    var clothes: [Cloth] { get set }
    var nextCloset: Closet? { get set }
    var maxWaist: Int { get }
    var minWaist: Int { get }
    
    func showEveryFittedClothes(for person: Person) -> [Cloth]
}

extension Closet {
    func showEveryFittedClothes(for person: Person) -> [Cloth] {
        if person.waist < minWaist {
            fatalError("Sorry \(person.name), your waist is too small. We don't have any clothes for your waist size.")
        } else if person.waist <= maxWaist {
            return clothes
        } else if let nextCloset = nextCloset {
            return nextCloset.showEveryFittedClothes(for: person)
        } else {
            fatalError("Sorry \(person.name), your waist is too big. We don't have any clothes for your waist size.")
        }
    }
}

struct SmallSizeCloset: Closet {
    var clothes: [Cloth]
    var nextCloset: Closet?
    var maxWaist: Int {
        return 76
    }
    var minWaist: Int {
        return 68
    }
}

struct MediumSizeCloset: Closet {
    var clothes: [Cloth]
    var nextCloset: Closet?
    var maxWaist: Int {
        return 84
    }
    var minWaist: Int {
        return 76
    }
}

struct LargeSizeCloset: Closet {
    var clothes: [Cloth]
    var nextCloset: Closet?
    var maxWaist: Int {
        return 94
    }
    var minWaist: Int {
        return 84
    }
}

let coconutCloth = Cloth(name: "coconut", price: 50)
let alohaCloth = Cloth(name: "aloha", price: 100)
let orangeCloth = Cloth(name: "orange", price: 30)
let bananaCloth = Cloth(name: "banana", price: 10)

let largeSizeCloset = LargeSizeCloset(clothes: [coconutCloth, bananaCloth, alohaCloth], nextCloset: nil)
let mediumSizeCloset = MediumSizeCloset(clothes: [coconutCloth, bananaCloth, alohaCloth, orangeCloth], nextCloset: largeSizeCloset)
let smallSizeCloset = SmallSizeCloset(clothes: [coconutCloth, bananaCloth], nextCloset: mediumSizeCloset)

let michael = Person(name: "michael", waist: 78)

let clothesForMichael = smallSizeCloset.showEveryFittedClothes(for: michael)

clothesForMichael.forEach { cloth in
    print(cloth.name)
}
