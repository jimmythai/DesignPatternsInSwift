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

// Creator
protocol PhoneFactory {
    func create() -> Phone
}

class Samsung: PhoneFactory {
    func create() -> Phone {
        return Galaxy()
    }
}

class Apple: PhoneFactory {
    func create() -> Phone {
        return iPhone()
    }
}
