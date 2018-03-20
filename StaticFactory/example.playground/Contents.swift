// Product
protocol Phone {
    func call()
    func browse()
}

class Galaxy: Phone {
    func call() {}
    func browse() {}
}

class iPhone: Phone {
    func call() {}
    func browse() {}
}

enum PhoneType {
    case iPhone
    case galaxy
}

// Creator
class PhoneFactory {
    static func create(_ type: PhoneType) -> Phone {
        switch type {
        case .iPhone:
            return iPhone()
        case .galaxy:
            return Galaxy()
        }
    }
}
