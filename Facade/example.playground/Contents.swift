// Category: Structural
// When to use: In case you want to have a simple API, which ask subsystems to work, but doesn't have a complex implementation.

import Foundation

struct SampleAppDateFormatter {
    private static let iso8601FullWithUtc = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
    
    func dateWithFormat(from string: String, with format: String = SampleAppDateFormatter.iso8601FullWithUtc) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: string)
    }
}
