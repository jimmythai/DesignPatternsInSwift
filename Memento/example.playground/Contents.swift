import Foundation
import PlaygroundSupport

struct BookMemento: Codable {
    var page = 0
    var readingTime = 0
    
    func apply(_ book: Book) {
        book.page = page
        book.readingTime = readingTime
    }
}

class Book {
    let name: String
    var page = 0
    var readingTime = 0
    private var timer: Timer?
    
    init(name: String) {
        self.name = name
    }
    
    func stop() {
        timer?.invalidate()
        
        let bookMemento = BookMemento(page: page, readingTime: readingTime)
        let bookMementoData = try? JSONEncoder().encode(bookMemento)
        UserDefaults.standard.set(bookMementoData, forKey: name)
    }
    
    func resume() {
        if let data = UserDefaults.standard.value(forKey: name) as? Data {
            let bookMemento = try? JSONDecoder().decode(BookMemento.self, from: data)
            bookMemento?.apply(self)
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [unowned self] timer in
            self.readingTime += 1
            print(self.readingTime)
        }
    }
    
    func flipPage() {
        page += 1
    }
}

var windNovel: Book! = Book(name: "wind")

windNovel.resume()
windNovel.flipPage()
windNovel.flipPage()

DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
    windNovel.stop()
    windNovel = nil
    
    windNovel = Book(name: "wind")
    windNovel.resume()
    
    print("Page: \(windNovel.page), Reading time: \(windNovel.readingTime)")
    
    windNovel.stop()
}

PlaygroundPage.current.needsIndefiniteExecution = true

