import Foundation

struct Message: Codable, Identifiable {
    let id = UUID()
    let username: String
    let value: String
    let timestamp: String
    
    var isFromLocalUser: Bool { username == User.local.name }
}
