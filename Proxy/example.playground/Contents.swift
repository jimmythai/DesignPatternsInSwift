// Example 1
protocol Network {
    func fetch() -> String
}

struct UserNetwork: Network {
    func fetch() -> String {
        return "Jimmy"
    }
}

struct UserNetworkProxy: Network {
    private var userNetwork: UserNetwork?
    
    mutating func authenticate(password: String) -> Bool {
        guard password == "password" else {
            return false
        }
        
        userNetwork = UserNetwork()
        
        return true
    }
    
    func fetch() -> String {
        guard let userNetwork = userNetwork else {
            return "Access denied."
        }
        
        return userNetwork.fetch()
    }
}

var userNetworkProxy = UserNetworkProxy()
userNetworkProxy.authenticate(password: "password")
userNetworkProxy.fetch()

// Example 2
struct UserNetworkProxy2: Network {
    let userNetwork = UserNetwork()
    
    func fetch() -> String {
        print("Logged network request!")
        
        return userNetwork.fetch()
    }
}

let userNetworkProxy2 = UserNetworkProxy2()
userNetworkProxy2.fetch()
