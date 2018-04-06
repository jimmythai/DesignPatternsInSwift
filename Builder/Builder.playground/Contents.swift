import Foundation

//Pattern 1
protocol Buildable {
    associatedtype BuildType

    func build() -> BuildType
}

class PersonBuilder: Buildable {
    typealias BuildType = Person

    private var firstName: String?
    private var middleName: String?
    private var lastName: String?

    func withFirstName(_ name: String) -> Self {
        firstName = name
        return self
    }

    func withMiddleName(_ name: String) -> Self {
        middleName = name
        return self
    }

    func withLastName(_ name: String) -> Self {
        lastName = name
        return self
    }

    func build() -> Person {
        let person = Person(firstName: firstName, middleName: middleName, lastName: lastName)

        return person
    }
}

//Pattern 2
struct Person {
    let firstName: String?
    let middleName: String?
    let lastName: String?

    var wholeName: String? {
        let name = [firstName, middleName, lastName]
            .compactMap { $0 }
            .joined(separator: " ")
            .trimmingCharacters(in: .whitespaces)

        if name.isEmpty {
            return nil
        }

        return name
    }
}

let person = PersonBuilder()
    .withFirstName("Jimmy")
    .withMiddleName("Thai")
    .withLastName("Yamamoto")
    .build()
print(person.wholeName ?? "")

class PersonBuilder2 {
    var firstName: String?
    var middleName: String?
    var lastName: String?

    typealias BuilderClosure = (PersonBuilder2) -> ()

    init(builderClosure: BuilderClosure) {
        builderClosure(self)
    }
}

struct Person2 {
    let firstName: String?
    let middleName: String?
    let lastName: String?

    init(builder: PersonBuilder2) {
        firstName = builder.firstName
        middleName = builder.middleName
        lastName = builder.lastName
    }

    var wholeName: String? {
        let name = [firstName, middleName, lastName]
            .compactMap { $0 }
            .joined(separator: " ")
            .trimmingCharacters(in: .whitespaces)
        
        if name.isEmpty {
            return nil
        }

        return name
    }
}

let personBuilder2 = PersonBuilder2 {
    $0.firstName = "Jimmy"
    $0.middleName = "Thai"
    $0.lastName = "Yamamoto"
}
let person2 = Person2(builder: personBuilder2)
print(person2.wholeName ?? "")

