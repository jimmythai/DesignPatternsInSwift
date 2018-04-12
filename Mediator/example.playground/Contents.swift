protocol Mediator {
    func notify(number: Int, sender: Balancer)
}

class BalancerMediator: Mediator {
    var balancers = [Balancer]()
    
    func add(balancer: Balancer) {
        balancers.append(balancer)
    }
    
    func notify(number: Int, sender: Balancer) {
        balancers.forEach { balancer in
            guard sender.id != balancer.id else { return }
            
            balancer.receive(number: number, multiplier: sender.multiplier)
        }
    }
}

protocol Balancer {
    var mediator: BalancerMediator { get }
    var id: Int { get }
    var multiplier: Int { get }
    var number: Int { get set }
    func change(number: Int)
    func receive(number: Int, multiplier: Int)
}

class BalancerForX1: Balancer {
    var mediator: BalancerMediator
    var id: Int {
        return 1
    }
    var multiplier: Int {
        return 1
    }
    var number = 0
    
    init(mediator: BalancerMediator) {
        self.mediator = mediator
    }
    
    func change(number: Int) {
        self.number = number
        mediator.notify(number: number, sender: self)
    }
    
    func receive(number: Int, multiplier: Int) {
        self.number = number * self.multiplier / multiplier
    }
}

class BalancerForX2: Balancer {
    var mediator: BalancerMediator
    var id: Int {
        return 2
    }
    var multiplier: Int {
        return 2
    }
    var number = 0
    
    init(mediator: BalancerMediator) {
        self.mediator = mediator
    }
    
    func change(number: Int) {
        self.number = number
        mediator.notify(number: number, sender: self)
    }
    
    func receive(number: Int, multiplier: Int) {
        self.number = number * self.multiplier / multiplier
    }
}

class BalancerForX3: Balancer {
    var mediator: BalancerMediator
    var id: Int {
        return 3
    }
    var multiplier: Int {
        return 3
    }
    var number = 0
    
    init(mediator: BalancerMediator) {
        self.mediator = mediator
    }
    
    func change(number: Int) {
        self.number = number
        mediator.notify(number: number, sender: self)
    }
    
    func receive(number: Int, multiplier: Int) {
        self.number = number * self.multiplier / multiplier
    }
}


var balancerMediator = BalancerMediator()

let balancerForX1 = BalancerForX1(mediator: balancerMediator)
let balancerForX2 = BalancerForX2(mediator: balancerMediator)
let balancerForX3 = BalancerForX3(mediator: balancerMediator)

balancerMediator.add(balancer: balancerForX1)
balancerMediator.add(balancer: balancerForX2)
balancerMediator.add(balancer: balancerForX3)

balancerForX1.change(number: 2)

print(balancerForX1.number)
print(balancerForX2.number)
print(balancerForX3.number)
