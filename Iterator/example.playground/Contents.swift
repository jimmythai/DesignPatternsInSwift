// Define
struct Backpack {
    let name: String
    let brandName: String
    let price: Int
    let currency: String
}

struct Backpacks {
    let backpacks: [Backpack]
}

struct BackpacksIterator: IteratorProtocol {
    typealias Element = Backpack

    private let backpacks: [Element]
    private var offset = 0

    init(backpacks: [Element]) {
        self.backpacks = backpacks
    }

    mutating func next() -> BackpacksIterator.Element? {
        defer {
            offset += 1
        }

        return backpacks.count > offset ? backpacks[offset] : nil
    }
}

extension Backpacks: Sequence {
    typealias Iterator = BackpacksIterator
    
    func makeIterator() -> Iterator {
        return BackpacksIterator(backpacks: backpacks)
    }
}


// Use
let backpacks = Backpacks(backpacks: [Backpack(name: "QUANTUM 70 + 10", brandName: "Deuter", price: 255, currency: "€")])
for backpack in backpacks {
    print("Name: \(backpack.name), Brand name: \(backpack.brandName), Price: \(backpack.price)\(backpack.currency)")
}

// Inside of for loop
// var iterator = someSequence.makeItrator()
// while let element = iterator.next() {
//     doSomething(with: element)
// }
