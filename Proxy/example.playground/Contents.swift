// Category: Structural
// When to use: In case you want to control the access to an object and handle things that it can't deal with.

// Example 1 (Protection proxy)
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
